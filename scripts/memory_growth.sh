#!/usr/bin/env bash
set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 1

OUT="results/memory-growth"
mkdir -p "$OUT"

CSV="$OUT/memory-growth.csv"
LOG="$OUT/build.log"

printf 'compiler,optimization,mode,bytes,stack_frame_bytes\n' > "$CSV"
: > "$LOG"

sizes=(1024 4096 16384 32768 65536 131072 262144)
optimizations=(-O0 -O2 -Os)

for compiler in gcc clang tcc; do
    if ! command -v "$compiler" >/dev/null 2>&1; then
        echo "SKIP: $compiler not installed" | tee -a "$LOG"
        continue
    fi

    for opt in "${optimizations[@]}"; do
        for bytes in "${sizes[@]}"; do
            for mode in stack heap; do
                src="src/memory_${mode}.c"
                tag="${compiler}_${opt#-}_${mode}_${bytes}"
                bin="$OUT/$tag"
                stack_bytes=""

                if [[ "$compiler" == "gcc" || "$compiler" == "clang" ]]; then
                    if [[ "$mode" == "stack" ]]; then
                        if ! "$compiler" -std=c11 "$opt" \
                            -Wall -Wextra -Wpedantic \
                            -fstack-usage \
                            -DBUFFER_SIZE="$bytes" \
                            "$src" -o "$bin" \
                            >>"$LOG" 2>&1; then
                            echo "FAIL: $tag (see $LOG)"
                            continue
                        fi

                        su="${bin}-memory_stack.su"
                        if [[ ! -f "$su" ]]; then
                            su="${bin}.su"
                        fi

                        if [[ -f "$su" ]]; then
                            stack_bytes="$(
                                awk '
                                    /run_stack_test/ { value = $2; found = 1; exit }
                                    /main/ { main_value = $2 }
                                    END {
                                        if (found) print value
                                        else if (main_value != "") print main_value
                                    }
                                ' "$su"
                            )"
                        fi
                    else
                        if ! "$compiler" -std=c11 "$opt" \
                            -Wall -Wextra -Wpedantic \
                            -DBUFFER_SIZE="$bytes" \
                            "$src" -o "$bin" \
                            >>"$LOG" 2>&1; then
                            echo "FAIL: $tag (see $LOG)"
                            continue
                        fi
                    fi
                else
                    if ! "$compiler" "$opt" \
                        -DBUFFER_SIZE="$bytes" \
                        "$src" -o "$bin" \
                        >>"$LOG" 2>&1; then
                        echo "FAIL: $tag (see $LOG)"
                        continue
                    fi
                fi

                if ! "$bin" >/dev/null 2>>"$LOG"; then
                    echo "FAIL: execution $tag (see $LOG)"
                    continue
                fi

                printf '%s,%s,%s,%s,%s\n' \
                    "$compiler" "$opt" "$mode" "$bytes" "$stack_bytes" \
                    >> "$CSV"
            done
        done
    done
done

echo
echo "Experiment finished."
echo "CSV: $CSV"
echo "Log: $LOG"
echo
echo "First results:"
head -n 15 "$CSV"
