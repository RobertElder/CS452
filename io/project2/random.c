#include "random.h"
#ifdef LOCAL_DEBUGGING
#include <assert.h>
#else
#include "robio.h"
#endif

void RNG_Initialize(RNG * gen, unsigned int seed) {
	gen->a = 1103515245;
	gen->c = 12345;
	gen->m = 2147483648UL;
	gen->x = (seed * 1234567890) % gen->m;
}

unsigned int RNG_Get(RNG * gen) {
	unsigned int next_x = ((gen->a * gen->x + gen->c) % gen->m) & 0x3fffffff;
	gen->x = next_x;
	return next_x;
}

float RNG_GetFloat(RNG * gen) {
	return 1.0 * RNG_Get(gen) / 0x40000000;
}

unsigned int RNG_GetRange(RNG * gen, unsigned int lower, unsigned int upper) {
	unsigned int value = RNG_GetFloat(gen) * (upper + 1 - lower) + lower;

	if (value < lower) {
		value = lower;
	} else if (value > upper) {
		value = upper;
	}

#ifdef LOCAL_DEBUGGING
	assert(value <= upper);
	assert(value >= lower);
#else
	assert(value <= upper, "RNG_GetRange: returned an integer not in range (too big)");
	assert(value >= lower, "RNG_GetRange: returned an integer not in range (too small)");
#endif

	return value;
}
