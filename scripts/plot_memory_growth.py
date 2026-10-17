import csv
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parent.parent
CSV_PATH = ROOT / "results/memory-growth/memory-growth.csv"
OUT = ROOT / "results/memory-growth"
OUT.mkdir(parents=True, exist_ok=True)

with CSV_PATH.open(newline="", encoding="utf-8") as file:
    rows = list(csv.DictReader(file))

# Graph 1: requested stack buffer size vs measured stack frame.
fig, ax = plt.subplots(figsize=(10, 6))

for compiler in ("gcc", "clang"):
    for optimization in ("-O0", "-O2", "-Os"):
        subset = [
            row for row in rows
            if row["compiler"] == compiler
            and row["optimization"] == optimization
            and row["mode"] == "stack"
            and row["stack_frame_bytes"].strip()
        ]
        subset.sort(key=lambda row: int(row["bytes"]))

        if subset:
            x = [int(row["bytes"]) for row in subset]
            y = [int(row["stack_frame_bytes"]) for row in subset]
            ax.plot(
                x, y, marker="o",
                label=f"{compiler.upper()} {optimization}"
            )

ax.set_title("Stack frame size vs local buffer size")
ax.set_xlabel("Local buffer size (bytes)")
ax.set_ylabel("Measured stack frame (bytes)")
ax.grid(True, alpha=0.3)
ax.legend()
fig.tight_layout()
fig.savefig(OUT / "stack-growth.png", dpi=160)
plt.close(fig)

# Graph 2: requested heap allocation size.
heap_rows = [
    row for row in rows
    if row["mode"] == "heap"
]
sizes = sorted({int(row["bytes"]) for row in heap_rows})

fig, ax = plt.subplots(figsize=(10, 6))
ax.plot(sizes, sizes, marker="o", label="Requested malloc size")
ax.set_title("Requested heap allocation size")
ax.set_xlabel("Test buffer size (bytes)")
ax.set_ylabel("Requested allocation (bytes)")
ax.grid(True, alpha=0.3)
ax.legend()
fig.tight_layout()
fig.savefig(OUT / "heap-requested-size.png", dpi=160)
plt.close(fig)

print(f"Saved: {OUT / 'stack-growth.png'}")
print(f"Saved: {OUT / 'heap-requested-size.png'}")
print("Note: the heap graph shows requested allocation size, not actual RSS.")
