/*
 * libtest.h
 *
 *  Created on: Dec 1, 2014
 *      Author: Alistair A. Israel
 */

#ifndef LIBTEST_H_
#define LIBTEST_H_

#include "original_only.h"

#ifdef __cplusplus
extern "C" {
#endif

int mean(int x, int y);

int mean_va(int count, ...);

#ifdef __cplusplus
}
#endif

#endif /* LIBTEST_H_ */
