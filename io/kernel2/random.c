#include "random.h"
#include "robio.h"

void RNG_Initialize(RNG * gen) {
	gen->a = 1103515245;
	gen->c = 12345;
	gen->x = 42;
	gen->m = 2147483648UL;
}

unsigned int RNG_Get(RNG * gen) {
	unsigned int next_x = (gen->a * gen->x + gen->c) & 0x3fffffff;
	gen->x = next_x;
	return next_x;
}

float RNG_GetFloat(RNG * gen) {
	return (float) RNG_Get(gen) / 0x3fffffff;
}

unsigned int RNG_GetRange(RNG * gen, unsigned int lower, unsigned int upper) {
	unsigned int value = RNG_GetFloat(gen) * (upper + 1 - lower) + lower;

	assert(value <= upper, "RNG_GetRange: returned an integer not in range (too big)");
	assert(value >= lower, "RNG_GetRange: returned an integer not in range (too small)");

	return value;
}
