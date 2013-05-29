#include "random.h"

void RNG_Initialize(RNG * gen) {
	gen->a = 1103515245;
	gen->c = 12345;
	gen->x = 42;
	gen->m = 2147483648UL;
}

unsigned int RNG_Get(RNG * gen) {
	unsigned int next_x = gen->a * gen->x + gen->c;
	gen->x = next_x & 0x3fffffff;
	return next_x;
}

float RNG_GetFloat(RNG * gen) {
	return RNG_Get(gen) / gen->m;
}

unsigned int RNG_GetRange(RNG * gen, unsigned int lower, unsigned int upper) {
	return RNG_GetFloat(gen) * (upper - lower) + lower;
}
