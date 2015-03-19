/*
 * meaner.c
 *
 *  Created on: Dec 3, 2014
 *      Author: aisrael
 */

#include <stdarg.h>
#include "libtest.h"

int mean_va(int count, ...) {
	va_list ap;
	int j;
	long tot = 0;
	va_start(ap, count); // Requires the last fixed parameter (to get the address)
	for(j = 0; j < count; j++) {
		tot += va_arg(ap, int); //Requires the type to cast to. Increments ap to the next argument.
	}
	va_end(ap);
	return tot / count;
}
