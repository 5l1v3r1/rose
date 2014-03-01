/**
 * correlation.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#   define N ARRAYSIZE
#   define M ARRAYSIZE
# define _PB_N ARRAYSIZE
# define _PB_M ARRAYSIZE

int main(int argc,char **argv)
{
/* Retrieve problem size. */
  int n = 16;
  int m = 16;
  double data[16][16];
  double symmat[16][16];
  double mean[16];
  double stddev[16];
  int i;
  int j;
  int j1;
  int j2;
  double float_n = 1.2;
  double eps = 0.1f;
#define sqrt_of_array_cell(x,j) sqrt(x[j])
  
#pragma scop
{
    int c1;
    int c2;
    int c4;
    int c3;
#pragma omp parallel for private(c4)
    for (c1 = 0; c1 <= 7; c1++) {
#pragma ivdep
#pragma vector always
#pragma simd
      for (c4 = 2 * c1; c4 <= 2 * c1 + 1; c4++) {
        mean[c4] = 0.0;
      }
    }
#pragma omp parallel for private(c3, c4, c2)
    for (c1 = 0; c1 <= 7; c1++) {
      for (c2 = 0; c2 <= 3; c2++) {
        for (c3 = 4 * c2; c3 <= 4 * c2 + 3; c3++) {
#pragma ivdep
#pragma vector always
#pragma simd
          for (c4 = 2 * c1; c4 <= 2 * c1 + 1; c4++) {
            mean[c4] += data[c3][c4];
          }
        }
      }
    }
#pragma omp parallel for private(c4)
    for (c1 = 0; c1 <= 7; c1++) {
#pragma ivdep
#pragma vector always
#pragma simd
      for (c4 = 2 * c1; c4 <= 2 * c1 + 1; c4++) {
        mean[c4] /= float_n;
      }
    }
  }
/* Determine standard deviations of column vectors of data matrix. */
  for (j = 0; j < 16; j++) {{
      int c4;
      stddev[j] = 0.0;
      for (c4 = 0; c4 <= 15; c4++) {
        stddev[j] += (data[c4][j] - mean[j]) * (data[c4][j] - mean[j]);
      }
      stddev[j] /= float_n;
    }
    stddev[j] = sqrt(stddev[j]);
{
/* The following in an inelegant but usual way to handle
	 near-zero std. dev. values, which below would cause a zero-
	 divide. */
      stddev[j] = (stddev[j] <= eps?1.0 : stddev[j]);
    }
  }
/* Center and reduce the column vectors. */
  for (i = 0; i < 16; i++) 
    for (j = 0; j < 16; j++) {
      data[i][j] -= mean[j];
      data[i][j] /= sqrt(float_n) * stddev[j];
    }
{
    int c1;
    int c3;
    int c4;
    int c6;
    int c2;
    symmat[16 - 1][16 - 1] = 1.0;
#pragma omp parallel for private(c2, c6, c4)
    for (c1 = 0; c1 <= 7; c1++) {
      for (c2 = ((c1 + -1) * 2 < 0?-(-(c1 + -1) / 2) : ((2 < 0?(-(c1 + -1) + - 2 - 1) / - 2 : (c1 + -1 + 2 - 1) / 2))); c2 <= 3; c2++) {
        for (c4 = 2 * c1; c4 <= ((2 * c1 + 1 < 4 * c2 + 2?2 * c1 + 1 : 4 * c2 + 2)); c4++) {
#pragma ivdep
#pragma vector always
#pragma simd
          for (c6 = (4 * c2 > c4 + 1?4 * c2 : c4 + 1); c6 <= 4 * c2 + 3; c6++) {
            symmat[c4][c6] = 0.0;
          }
        }
      }
    }
#pragma omp parallel for private(c2, c6, c4, c3)
    for (c1 = 0; c1 <= 7; c1++) {
      for (c2 = ((c1 + -1) * 2 < 0?-(-(c1 + -1) / 2) : ((2 < 0?(-(c1 + -1) + - 2 - 1) / - 2 : (c1 + -1 + 2 - 1) / 2))); c2 <= 3; c2++) {
        for (c3 = 0; c3 <= 15; c3++) {
          for (c4 = 2 * c1; c4 <= ((2 * c1 + 1 < 4 * c2 + 2?2 * c1 + 1 : 4 * c2 + 2)); c4++) {
#pragma ivdep
#pragma vector always
#pragma simd
            for (c6 = (4 * c2 > c4 + 1?4 * c2 : c4 + 1); c6 <= 4 * c2 + 3; c6++) {
              symmat[c4][c6] += data[c3][c4] * data[c3][c6];
            }
          }
        }
      }
    }
#pragma omp parallel for private(c2, c6, c4)
    for (c1 = 0; c1 <= 7; c1++) {
      for (c2 = ((c1 + -1) * 2 < 0?-(-(c1 + -1) / 2) : ((2 < 0?(-(c1 + -1) + - 2 - 1) / - 2 : (c1 + -1 + 2 - 1) / 2))); c2 <= 3; c2++) {
        for (c4 = 2 * c1; c4 <= ((2 * c1 + 1 < 4 * c2 + 2?2 * c1 + 1 : 4 * c2 + 2)); c4++) {
#pragma ivdep
#pragma vector always
#pragma simd
          for (c6 = (4 * c2 > c4 + 1?4 * c2 : c4 + 1); c6 <= 4 * c2 + 3; c6++) {
            symmat[c6][c4] = symmat[c4][c6];
          }
        }
      }
    }
#pragma omp parallel for private(c4)
    for (c1 = 0; c1 <= 7; c1++) {
      for (c4 = 2 * c1; c4 <= ((14 < 2 * c1 + 1?14 : 2 * c1 + 1)); c4++) {
        symmat[c4][c4] = 1.0;
      }
    }
  }
  
#pragma endscop
  return 0;
}
