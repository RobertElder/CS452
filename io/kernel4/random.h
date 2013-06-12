#ifndef RANDOM_H_
#define RANDOM_H_

typedef struct RNG {
	unsigned int a;
	unsigned int c;
	unsigned int x;
	unsigned int m;
} RNG;

void RNG_Initialize(RNG * gen, unsigned int seed);

unsigned int RNG_Get(RNG * gen);

float RNG_GetFloat(RNG * gen);

unsigned int RNG_GetRange(RNG * gen, unsigned int lower, unsigned int upper);

#endif
