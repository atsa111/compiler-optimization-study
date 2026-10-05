#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#define DATA_SIZE 4096
#define REPEATS 2000

static uint32_t crc32(const uint8_t *data, size_t length)
{
    uint32_t crc = 0xFFFFFFFFu;

    for (size_t i = 0; i < length; ++i) {
        crc ^= data[i];

        for (unsigned bit = 0; bit < 8; ++bit) {
            uint32_t mask = -(crc & 1u);
            crc = (crc >> 1) ^ (0xEDB88320u & mask);
        }
    }

    return ~crc;
}

int main(void)
{
    uint8_t data[DATA_SIZE];

    for (size_t i = 0; i < DATA_SIZE; ++i)
        data[i] = (uint8_t)((i * 37u + 11u) & 0xFFu);

    uint32_t checksum = 0;

    for (unsigned i = 0; i < REPEATS; ++i)
        checksum ^= crc32(data, DATA_SIZE);

    printf("%u\n", checksum);
    return 0;
}
