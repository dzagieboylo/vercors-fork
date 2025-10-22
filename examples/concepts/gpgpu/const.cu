#include <cuda.h>

/*@
  requires 0 <= tx && tx < bdim;
  requires 0 <= bx && bx < gdim;
  ensures \result == bx*bdim+tx;
  ensures \result < gdim*bdim;
  ensures \result >= 0;
  ensures tx == \result % bdim;
  ensures bx == \result / bdim;
  @*/
/*@ pure @*/ int gtid(int gdim, int bdim, int bx, int tx) = tx + bx*bdim;


/*@
  context_everywhere c != NULL && a != NULL && b != NULL;
  context_everywhere \pointer_length(c) >= size && \pointer_length(a) >= size && \pointer_length(b) >= size;
  context_everywhere blockDim.x >= 1 && blockDim.y == 1 && blockDim.z == 1;
  context_everywhere gridDim.x >= 1 && gridDim.y == 1 && gridDim.z == 1;
  context_everywhere gtid(gridDim.x, blockDim.x, blockIdx.x, threadIdx.x) < size ==>
    Perm({: c[gtid(gridDim.x, blockDim.x, blockIdx.x, threadIdx.x)] :}, write);
@*/
__global__ void sum(float* c, const float* a, const float* b, int size) {
  int tid = threadIdx.x + blockIdx.x * blockDim.x;
  if (tid < size) {
    c[tid] = a[tid] + b[tid];
  }
}
