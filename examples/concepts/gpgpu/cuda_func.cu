//:: cases BasicCuda
//:: tool silicon
//:: verdict Pass

#include <cuda.h>

__device__ void sync(int a[]) {
  /*@
    requires Perm({:a[threadIdx.x + blockIdx.x*blockDim.x]:}, write);
    ensures threadIdx.x + blockIdx.x*blockDim.x == 0 ==> (\forall* int i; 0 <= i && i < blockDim.x; Perm({:a[i]:}, write));
  @*/
  __syncthreads();
}

/*@
    context_everywhere a != NULL && \pointer_length(a) >= blockDim.x;
    context blockDim.y == 1 && blockDim.z == 1 && gridDim.x == 1 && gridDim.y == 1 && gridDim.z == 1;
    requires Perm({:a[threadIdx.x]:}, write);
@*/
__global__ void example(int a[]) {
  int tid = threadIdx.x + blockIdx.x*blockDim.x;
  int result = a[tid];
  sync(a);
  if (tid == 0) {    
    /*@
      loop_invariant 0 <= i && i <= blockDim.x;
      loop_invariant (\forall* int i; 0 <= i && i < blockDim.x; Perm({:a[i]:}, write));
    @*/
    for (int i = 0; i < blockDim.x; i++) {
      a[tid] += a[i];
    }
  }
}

