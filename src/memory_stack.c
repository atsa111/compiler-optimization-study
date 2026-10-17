#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#ifndef BUFFER_SIZE
#define BUFFER_SIZE 1024
#endif

static uint64_t run_stack_test(void)
{
    volatile unsigned char buffer[BUFFER_SIZE];
    uint64_t checksum = 0;

    for (size_t i = 0; i < BUFFER_SIZE; ++i) {
        buffer[i] = (unsigned char)((i * 31u + 7u) & 0xffu);
    }

    for (size_t i = 0; i < BUFFER_SIZE; ++i) {
        checksum += buffer[i];
    }

    return checksum;
}

int main(void)
{
    uint64_t checksum = run_stack_test();

    printf("mode=stack bytes=%u checksum=%llu\n",
           (unsigned)BUFFER_SIZE,
           (unsigned long long)checksum);

    return 0;
}
