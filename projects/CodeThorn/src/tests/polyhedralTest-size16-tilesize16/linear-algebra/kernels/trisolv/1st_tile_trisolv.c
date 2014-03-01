#   define N ARRAYSIZE
# define _PB_N ARRAYSIZE
/**
 * trisolv.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

int main(int argc,char **argv)
{
/* Retrieve problem size. */
  int n = 16;
/* Variable declaration/allocation. */
  double A[16][16];
  double x[16];
  double c[16];
  int i;
  int j;
  
#pragma scop
{
    int c3;
    int c1;
    for (c3 = 0; c3 <= 15; c3++) {
      x[c3] = c[c3];
    }
    for (c1 = 0; c1 <= 16; c1++) {
      if (c1 >= 1 && c1 <= 14) {
        x[c1] = x[c1] - A[c1][c1 + -1] * x[c1 + -1];
        x[c1] = x[c1] / A[c1][c1];
        x[c1 + 1] = x[c1 + 1] - A[c1 + 1][c1 + -1] * x[c1 + -1];
        for (c3 = c1 + 2; c3 <= 15; c3++) {
          x[c3] = x[c3] - A[c3][c1 + -1] * x[c1 + -1];
        }
      }
      if (c1 == 15) {
        x[15] = x[15] - A[15][14] * x[14];
      }
      if (c1 == 0) {
        x[0] = x[0] / A[0][0];
      }
      if (c1 == 16) {
        x[15] = x[15] / A[15][15];
      }
    }
  }
  
#pragma endscop
  return 0;
}
