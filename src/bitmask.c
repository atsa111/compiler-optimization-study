#include <stdint.h>
#include <stdio.h>

static uint32_t update_register(uint32_t reg, uint32_t value)
{
    reg |= (1u << 3);
    reg &= ~(1u << 5);
    reg ^= (1u << 7);

    reg &= ~(0xFu << 8);
    reg |= (value & 0xFu) << 8;

    return reg;
}

int main(void)
{
    uint32_t reg = 0x12345678u;
    uint32_t checksum = 0;

    for (uint32_t i = 0; i < 10000000u; ++i) {
        reg = update_register(reg, i);
        checksum ^= reg;
    }

    printf("%u\n", checksum);
    return 0;
}
