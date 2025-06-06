#include <cuda.h>

#define TILE_SIZE 4

/*@
  context_everywhere blockDim.x == 4 && blockDim.y == 4 && blockDim.z == 1;
  context_everywhere gridDim.x == 1 && gridDim.y == 1 && gridDim.z == 1;
  context_everywhere A != NULL && C != NULL;
  context_everywhere \pointer_length(A) >= N;
  context_everywhere \pointer_length(C) >= 1;
  context_everywhere N > blockDim.x;
  context_everywhere (\forall* int i; 0<=i && i<N; Perm({:A[i]:}, read));
  context_everywhere get_local_id(1) == 0 && get_local_id(0) == 0 ==> Perm(C[0], write);
  requires Perm({:tmp[get_local_id(1)][get_local_id(0)]:}, write);

@*/
__global__ void tiled_kernel( float* A, float* C, int N) {


  __shared__ float tmp[TILE_SIZE][TILE_SIZE];

  int tx = threadIdx.x;
  int ty = threadIdx.y;
  float C_value = 0.0f;

  //Just some arbitrary computation
  tmp[tx][ty] = A[tx];

  __syncthreads();
  // Compute partial sum
  for (int k = 0; k < TILE_SIZE; ++k) {
    for (int j = 0; j < TILE_SIZE; ++j) {      
      C_value += tmp[j][k];
    }
  }
  __syncthreads();

  // Write the result
  if (tx == 0 && ty == 0) {
    *C = C_value;
  }
}
