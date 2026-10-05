.PHONY: all build benchmark system-info check lint test clean

all: build

build:
	./scripts/build.sh

benchmark: build
	./scripts/benchmark.sh

system-info:
	./scripts/system_info.sh > results/system-info.txt

lint:
	./scripts/lint.sh

test:
	./tests/run_tests.sh

check:
	bash -n scripts/build.sh
	bash -n scripts/benchmark.sh
	bash -n scripts/system_info.sh
	bash -n scripts/lint.sh
	bash -n tests/run_tests.sh

clean:
	rm -rf build
