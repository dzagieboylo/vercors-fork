#include <cuda.h>

  
#define TILE_SIZE 16

/*@
  context_everywhere blockDim.x == 16 && blockDim.y == 16 && blockDim.z == 1;
  context_everywhere gridDim.x >= 1 && gridDim.y >= 1 && gridDim.z == 1;
  context_everywhere A != NULL;
  context_everywhere \pointer_length(A) >= N;  
  context_everywhere (\forall* int i; 0<=i && i<N; Perm({: A[i] :}, read));
  requires Perm({: As[get_local_id(0)][get_local_id(1)] :}, write);
@*/
__global__ void matmul_tiled_kernel( float* A, int N) {
  __shared__ float As[TILE_SIZE][TILE_SIZE];
  int tx = threadIdx.x;
  int ty = threadIdx.y;
  for (int i = 0; i < N; i++) {
    As[tx][ty] = A[i];
  }
}
