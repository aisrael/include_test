/*
 * libtest.c
 *
 *  Created on: Dec 1, 2014
 *      Author: aisrael
 */

#include <stdarg.h>
#include "libtest.h"

int mean(int x, int y) {
	return mean_va(2, x, y); // mean_va() is defined in means.c
}

int mean3(int x, int y, int z) {
	return mean_va(3, x, y, z); // mean_va() is defined in means.c
}
