#include <cuda.h>

/*@
  ensures \pointer(\result, N, write);
  @*/
int* vercorsMallocInt(int N);

/*@
  given int size;
  requires \pointer(ar, size, write); 
  @*/
void vercorsFreeInt(int *ar);

/*@
  requires \pointer(a, size, write);
  ensures \result != NULL;
  ensures \pointer_length(\result) == size;
  ensures \pointer(a, size, write);
  @*/
const int* toConst(int *a, int size); //unsafe generation of const pointers

/*@
  context_everywhere blockDim.x > 0 && blockDim.y > 0 && blockDim.z > 0;
  context_everywhere gridDim.x == 1 && gridDim.y == 1 && gridDim.z == 1 ;  
  context_everywhere a != NULL && b != NULL && c != NULL && n > 0 && n >= blockDim.x && n >= blockDim.y && n >= blockDim.z;
  context_everywhere \pointer_length(a) >= n && \pointer_length(b) >= n && \pointer_length(c) >= n;
  @*/
__global__ void alldims(const int* a, const int* b, const int* c, int n) {
  int sum = a[threadIdx.x] + b[threadIdx.y] + c[threadIdx.z];
}

/*@
  context_everywhere blockDim.x > 0 && blockDim.y == 1 && blockDim.z == 1;
  context_everywhere gridDim.x > 0 && gridDim.y == 1 && gridDim.z == 1 ;  
  context_everywhere a != NULL && n > 0 && n >= blockDim.x;
  context_everywhere \pointer_length(a) >= n;
  context \shared_mem_size(tmp) >= blockDim.x;
  requires Perm({: tmp[threadIdx.x] :}, write);
  @*/
__global__ void dyn_shared(const int* a, int n) {
  extern __shared__ int64_t tmp[];
  tmp[threadIdx.x] = a[threadIdx.x];
}

int main() {
  int n = 64;
  int* a = vercorsMallocInt(n);
  const int* ac = toConst(a, n);
  int* b = vercorsMallocInt(n);
  const int* bc = toConst(b, n);
  int* c = vercorsMallocInt(n);
  const int* cc = toConst(c, n);
  dim3 blocks;
  dim3 grid;
  blocks.x = 4;
  blocks.y = 5;
  blocks.z = 9;
  grid.x = 1;
  grid.y = 1;
  grid.z = 1;
  alldims<<<grid,blocks>>>(ac, bc, cc, n);
  alldims<<<1, 12>>>(ac, bc, cc, n);
  dyn_shared<<<32,32,32*sizeof(int64_t)>>>(ac, n); //TODO sizeof functions don't work properly
  vercorsFreeInt(a) /*@ given {size=n} @*/;
  vercorsFreeInt(b) /*@ given {size=n} @*/;
  vercorsFreeInt(c) /*@ given {size=n} @*/;
}
