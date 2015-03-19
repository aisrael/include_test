//
//  main.cpp
//  MyTool
//
//  Created by Alistair A. Israel on 11/28/14.
//  Copyright (c) 2014 Alistair A. Israel. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include "libtest.h"

int roll() {
	return 1 + 100 * ((double) rand()/((double) RAND_MAX + 1));
}

int main(int argc, const char * argv[]) {
	int seed = time(NULL);
	printf("seed => %d\n", seed);
	srand(seed);

	int x = LIFE;
	printf("x => %d\n", x);
	int y = roll();
	printf("y => %d\n", y);
	int z = roll();
	printf("z => %d\n", z);

	printf(ABC("The mean of [%d, %d, %d] is %d") "\n", x, y, z, mean3(x, y, z));

    return 0;
}
