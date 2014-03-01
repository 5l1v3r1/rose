/**
 * fdtd-apml.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#   define CZ ARRAYSIZE
#   define CYM ARRAYSIZE
#   define CXM ARRAYSIZE
# define _PB_CZ ARRAYSIZE
# define _PB_CYM ARRAYSIZE
# define _PB_CXM ARRAYSIZE

int main(int argc,char **argv)
{
/* Retrieve problem size. */
  int cz = 16;
  int cym = 16;
  int cxm = 16;
/* Variable declaration/allocation. */
  double mui;
  double ch;
  double Ax[16 + 1][16 + 1];
  double Ry[16 + 1][16 + 1];
  double clf[16 + 1][16 + 1];
  double tmp[16 + 1][16 + 1];
  double Bza[16 + 1][16 + 1][16 + 1];
  double Ex[16 + 1][16 + 1][16 + 1];
  double Ey[16 + 1][16 + 1][16 + 1];
  double Hz[16 + 1][16 + 1][16 + 1];
  double czm[16 + 1];
  double czp[16 + 1];
  double cxmh[16 + 1];
  double cxph[16 + 1];
  double cymh[16 + 1];
  double cyph[16 + 1];
  int iz;
  int iy;
  int ix;
  
#pragma scop
{
    int c1;
    int c3;
    int c2;
{
      int c4;
      int c5;
      int c6;
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          for (c6 = 0; c6 <= 15; c6++) {
            clf[c4][c5] = Ex[c4][c5][c6] - Ex[c4][c5 + 1][c6] + Ey[c4][c5][c6 + 1] - Ey[c4][c5][c6];
            tmp[c4][c5] = cymh[c5] / cyph[c5] * Bza[c4][c5][c6] - ch / cyph[c5] * clf[c4][c5];
            Hz[c4][c5][c6] = cxmh[c6] / cxph[c6] * Hz[c4][c5][c6] + mui * czp[c4] / cxph[c6] * tmp[c4][c5] - mui * czm[c4] / cxph[c6] * Bza[c4][c5][c6];
            Bza[c4][c5][c6] = tmp[c4][c5];
          }
        }
      }
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          clf[c4][c5] = Ex[c4][c5][16] - Ex[c4][c5 + 1][16] + Ry[c4][c5] - Ey[c4][c5][16];
        }
      }
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          tmp[c4][c5] = cymh[c5] / cyph[c5] * Bza[c4][c5][16] - ch / cyph[c5] * clf[c4][c5];
        }
      }
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          Hz[c4][c5][16] = cxmh[16] / cxph[16] * Hz[c4][c5][16] + mui * czp[c4] / cxph[16] * tmp[c4][c5] - mui * czm[c4] / cxph[16] * Bza[c4][c5][16];
        }
      }
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          Bza[c4][c5][16] = tmp[c4][c5];
        }
      }
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          for (c6 = 0; c6 <= 15; c6++) {
            clf[c4][c5] = Ex[c4][16][c6] - Ax[c4][c6] + Ey[c4][16][c6 + 1] - Ey[c4][16][c6];
            tmp[c4][c5] = cymh[16] / cyph[c5] * Bza[c4][c5][c6] - ch / cyph[c5] * clf[c4][c5];
            Hz[c4][16][c6] = cxmh[c6] / cxph[c6] * Hz[c4][16][c6] + mui * czp[c4] / cxph[c6] * tmp[c4][c5] - mui * czm[c4] / cxph[c6] * Bza[c4][16][c6];
            Bza[c4][16][c6] = tmp[c4][c5];
          }
        }
      }
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          clf[c4][c5] = Ex[c4][16][16] - Ax[c4][16] + Ry[c4][16] - Ey[c4][16][16];
        }
      }
      for (c4 = 0; c4 <= 15; c4++) {
        for (c5 = 0; c5 <= 15; c5++) {
          tmp[c4][c5] = cymh[16] / cyph[16] * Bza[c4][16][16] - ch / cyph[16] * clf[c4][c5];
          Hz[c4][16][16] = cxmh[16] / cxph[16] * Hz[c4][16][16] + mui * czp[c4] / cxph[16] * tmp[c4][c5] - mui * czm[c4] / cxph[16] * Bza[c4][16][16];
          Bza[c4][16][16] = tmp[c4][c5];
        }
      }
    }
  }
  
#pragma endscop
  return 0;
}
