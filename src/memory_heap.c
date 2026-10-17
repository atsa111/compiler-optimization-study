#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef BUFFER_SIZE
#define BUFFER_SIZE 1024
#endif

int main(void)
{
    unsigned char *buffer = malloc(BUFFER_SIZE);

    if (buffer == NULL) {
        perror("malloc");
        return 1;
    }

    uint64_t checksum = 0;

    for (size_t i = 0; i < BUFFER_SIZE; ++i) {
        buffer[i] = (unsigned char)((i * 31u + 7u) & 0xffu);
    }

    for (size_t i = 0; i < BUFFER_SIZE; ++i) {
        checksum += buffer[i];
    }

    printf("mode=heap bytes=%u checksum=%llu\n",
           (unsigned)BUFFER_SIZE,
           (unsigned long long)checksum);

    free(buffer);
    return 0;
}
