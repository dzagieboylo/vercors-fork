#include <cuda.h>

/*@ ensures \result != NULL;  
    ensures \pointer_length(\result) == N;
    ensures (\forall* int j; 0 <= j && j < N; Perm({: \result[j] :}, write));    
@*/
int *vercorsMallocInt(int N);


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
@*/
__global__ void tiled_kernel( float* A, float* C, int N) {


  int* oned[2];

  oned[0] = vercorsMallocInt(3);
  oned[1] = vercorsMallocInt(3);

  //@ assert Perm(oned[0][0], write) ** Perm(oned[1][0], write) ** Perm(oned[0][1], write) ** Perm(oned[1][1], write) ** Perm(oned[0][2], write) ** Perm(oned[1][2], write);
  //@ assert (\forall* int j, int k; 0 <= j && j < 2 && 0 <= k && k < 3; Perm({:oned[j][k]:}, write));

  //@ loop_invariant 0 <= i && i <= 2;
  //@ loop_invariant (\forall* int j; 0 <= j && j < 2; Perm({:oned[j]:}, write));
  //@ loop_invariant (\forall  int j; 0 <= j && j < i; {: oned[j] :} != NULL && \pointer_length({: oned[j] :}) == 3);
  //@ loop_invariant (\forall* int j, int k; 0 <= j && j < i && 0 <= k && k < 3; Perm({:oned[j][k]:}, write));
  for (int i = 0; i < 2; i += 1) {
    oned[i] = vercorsMallocInt(3);
    //@ assert (\forall* int j; 0 <= j && j < 3; Perm({:oned[i][j]:}, write));
  }

  //@ assert (\forall int j; 0 <= j && j < 2; {: oned[j] :} != NULL && \pointer_length({: oned[j] :}) == 3);
  //@ assert (\forall int j, int k; 0 <= j && j < k && k < 2; {: oned[k] :} != {: oned[j] :} );
  //@ inhale (\forall* int j; 0 <= j && j < 2; Perm({: oned[j][1] :}, write));

  
  
  oned[0][0] = 0;
  
  // float tmp[TILE_SIZE][TILE_SIZE];
  
  // int tx = threadIdx.x;
  // int ty = threadIdx.y;
  // float C_value = 0.0f;
  


  // // //Just some arbitrary computation
  // tmp[tx][ty] = A[tx];

  // __syncthreads();
  // // Compute partial sum
  // for (int k = 0; k < TILE_SIZE; ++k) {
  //   for (int j = 0; j < TILE_SIZE; ++j) {      
  //     C_value += tmp[j][k];
  //   }
  // }
  // __syncthreads();

  // // Write the result
  // if (tx == 0 && ty == 0) {
  //   *C = C_value;
  // }
}
