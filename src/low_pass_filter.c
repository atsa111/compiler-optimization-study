#include <stdint.h>
#include <stdio.h>

#define SAMPLE_COUNT 5000000

static int32_t low_pass(int32_t previous, int32_t input)
{
    return previous + ((input - previous) >> 3);
}

int main(void)
{
    int32_t filtered = 0;
    int64_t checksum = 0;

    for (uint32_t i = 0; i < SAMPLE_COUNT; ++i) {
        int32_t sample =
            (int32_t)((i * 37u + (i >> 3)) % 4096u) - 2048;

        filtered = low_pass(filtered, sample);
        checksum += filtered;
    }

    printf("%lld\n", (long long)checksum);
    return 0;
}
