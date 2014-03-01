/**
 * fdtd-2d.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#   define TMAX STEPSIZE
#   define NX ARRAYSIZE
#   define NY ARRAYSIZE
# define _PB_TMAX STEPSIZE 
# define _PB_NX ARRAYSIZE
# define _PB_NY ARRAYSIZE

int main(int argc,char **argv)
{
/* Retrieve problem size. */
  int tmax = 2;
  int nx = 16;
  int ny = 16;
/* Variable declaration/allocation. */
  double ex[16][16];
  double ey[16][16];
  double hz[16][16];
  double _fict_[2];
  int t;
  int i;
  int j;
  
#pragma scop
{
    int c2;
    int c3;
    int c0;
{
      int c6;
      int c7;
      int c4;
      for (c4 = 1; c4 <= 2; c4++) {
        if (c4 == 2) {
          ey[1][15] = ey[1][15] - 0.5 * (hz[1][15] - hz[1 - 1][15]);
          ey[0][15] = _fict_[0];
        }
        if (c4 == 1) {
          ex[0][1] = ex[0][1] - 0.5 * (hz[0][1] - hz[0][1 - 1]);
          ey[1][1 + - 1] = ey[1][1 + - 1] - 0.5 * (hz[1][1 + - 1] - hz[1 - 1][1 + - 1]);
          ey[0][1 + - 1] = _fict_[0];
          hz[0][1 + - 1] = hz[0][1 + - 1] - 0.7 * (ex[0][1 + - 1 + 1] - ex[0][1 + - 1] + ey[0 + 1][1 + - 1] - ey[0][1 + - 1]);
          ey[0][0] = _fict_[1];
        }
        if (c4 == 2) {
          ex[0][16 + - 1] = ex[0][16 + - 1] - 0.5 * (hz[0][16 + - 1] - hz[0][16 + - 1 - 1]);
          ey[0][16 + - 1] = _fict_[1];
        }
        if (c4 == 1) {
          for (c7 = 2; c7 <= 15; c7++) {
            ex[0][c7] = ex[0][c7] - 0.5 * (hz[0][c7] - hz[0][c7 - 1]);
            ey[1][c7 + - 1] = ey[1][c7 + - 1] - 0.5 * (hz[1][c7 + - 1] - hz[1 - 1][c7 + - 1]);
            ey[0][c7 + - 1] = _fict_[0];
            hz[0][c7 + - 1] = hz[0][c7 + - 1] - 0.7 * (ex[0][c7 + - 1 + 1] - ex[0][c7 + - 1] + ey[0 + 1][c7 + - 1] - ey[0][c7 + - 1]);
            ex[0][c7 + - 1] = ex[0][c7 + - 1] - 0.5 * (hz[0][c7 + - 1] - hz[0][c7 + - 1 - 1]);
            ey[0][c7 + - 1] = _fict_[1];
          }
        }
      }
      for (c4 = 3; c4 <= 16; c4++) {
        ey[c4 + -1][15] = ey[c4 + -1][15] - 0.5 * (hz[c4 + -1][15] - hz[c4 + -1 - 1][15]);
      }
      for (c7 = 1; c7 <= 15; c7++) {
        ex[15][c7] = ex[15][c7] - 0.5 * (hz[15][c7] - hz[15][c7 - 1]);
      }
      for (c4 = 2; c4 <= 16; c4++) {
        if (c4 <= 15) {
          ey[c4 + - 1 * 0][1 + - 1] = ey[c4 + - 1 * 0][1 + - 1] - 0.5 * (hz[c4 + - 1 * 0][1 + - 1] - hz[c4 + - 1 * 0 - 1][1 + - 1]);
          ex[c4 + - 1][1 + - 1 * 0] = ex[c4 + - 1][1 + - 1 * 0] - 0.5 * (hz[c4 + - 1][1 + - 1 * 0] - hz[c4 + - 1][1 + - 1 * 0 - 1]);
          hz[c4 + - 1 * 0 + - 1][1 + - 1 * 0 + - 1] = hz[c4 + - 1 * 0 + - 1][1 + - 1 * 0 + - 1] - 0.7 * (ex[c4 + - 1 * 0 + - 1][1 + - 1 * 0 + - 1 + 1] - ex[c4 + - 1 * 0 + - 1][1 + - 1 * 0 + - 1] + ey[c4 + - 1 * 0 + - 1 + 1][1 + - 1 * 0 + - 1] - ey[c4 + - 1 * 0 + - 1][1 + - 1 * 0 + - 1]);
          ey[c4 + - 1][0] = ey[c4 + - 1][0] - 0.5 * (hz[c4 + - 1][0] - hz[c4 + - 1 - 1][0]);
        }
        if (c4 == 16) {
          ey[16 + - 1][0] = ey[16 + - 1][0] - 0.5 * (hz[16 + - 1][0] - hz[16 + - 1 - 1][0]);
        }
        for (c6 = 2; c6 <= 16; c6++) {
          for (c7 = (((0 > c4 + -15?0 : c4 + -15)) > c6 + -15?((0 > c4 + -15?0 : c4 + -15)) : c6 + -15); c7 <= 1; c7++) {
            ey[c4 + - 1 * c7][c6 + - 1] = ey[c4 + - 1 * c7][c6 + - 1] - 0.5 * (hz[c4 + - 1 * c7][c6 + - 1] - hz[c4 + - 1 * c7 - 1][c6 + - 1]);
            ex[c4 + - 1][c6 + - 1 * c7] = ex[c4 + - 1][c6 + - 1 * c7] - 0.5 * (hz[c4 + - 1][c6 + - 1 * c7] - hz[c4 + - 1][c6 + - 1 * c7 - 1]);
            hz[c4 + - 1 * c7 + - 1][c6 + - 1 * c7 + - 1] = hz[c4 + - 1 * c7 + - 1][c6 + - 1 * c7 + - 1] - 0.7 * (ex[c4 + - 1 * c7 + - 1][c6 + - 1 * c7 + - 1 + 1] - ex[c4 + - 1 * c7 + - 1][c6 + - 1 * c7 + - 1] + ey[c4 + - 1 * c7 + - 1 + 1][c6 + - 1 * c7 + - 1] - ey[c4 + - 1 * c7 + - 1][c6 + - 1 * c7 + - 1]);
          }
        }
      }
    }
  }
  
#pragma endscop
  return 0;
}
