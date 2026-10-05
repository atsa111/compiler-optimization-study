#include <stdint.h>
#include <stdio.h>

#define BUFFER_SIZE 256

typedef struct {
    uint32_t data[BUFFER_SIZE];
    unsigned head;
    unsigned tail;
    unsigned count;
} RingBuffer;

static int push(RingBuffer *buffer, uint32_t value)
{
    if (buffer->count == BUFFER_SIZE)
        return 0;

    buffer->data[buffer->head] = value;
    buffer->head = (buffer->head + 1u) % BUFFER_SIZE;
    ++buffer->count;

    return 1;
}

static int pop(RingBuffer *buffer, uint32_t *value)
{
    if (buffer->count == 0)
        return 0;

    *value = buffer->data[buffer->tail];
    buffer->tail = (buffer->tail + 1u) % BUFFER_SIZE;
    --buffer->count;

    return 1;
}

int main(void)
{
    RingBuffer buffer = {0};
    uint32_t value = 0;
    uint64_t checksum = 0;

    for (uint32_t i = 0; i < 5000000u; ++i) {
        push(&buffer, i);

        if ((i & 1u) != 0u && pop(&buffer, &value))
            checksum += value;
    }

    while (pop(&buffer, &value))
        checksum += value;

    printf("%llu\n", (unsigned long long)checksum);

    return 0;
}
