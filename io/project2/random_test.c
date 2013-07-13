#include "random.h"
#include "stdio.h"

void asm_AssertKernelEntry() {
}

void main() {
	RNG rng;

	int seed;
	for (seed = 0; seed < 100; seed++) {
		RNG_Initialize(&rng, seed);

		unsigned int totals[7] = { };
		unsigned int sum = 0;
		int round;
		int total_rounds = 1000000;

		for (round = 0; round < total_rounds; round++) {
			int n = RNG_GetRange(&rng, 0, 6);
			totals[n] += 1;
			sum += n;
		}

		printf("Seed %d", seed);
		int i;
		for (i = 0; i < 7; i++) {
			printf("\t%d %d", i, (int) (1.0 * totals[i] / total_rounds * 100.0));
		}

		printf("\tAvg=%f", (float) (sum / total_rounds));

		printf("\n");
	}

	for (seed = 0; seed < 100; seed++) {
		RNG_Initialize(&rng, seed);

		unsigned int totals[10] = { };
		unsigned int sum = 0;
		int round;

		printf("Seed %d", seed);
		for (round = 0; round < 10; round++) {
			int n = RNG_GetRange(&rng, 1, 3);
			printf("\t%d", n);
		}

		printf("\n");
	}
}
