

int main(int argc, char **argv) {
  int a[4] = {1,2,3,4};

#pragma omp parallel
  {
  for (int i = 0; i < 4; ++i) {
    a[i] = 3*a[i];
  }
  }
  return 0;
}
