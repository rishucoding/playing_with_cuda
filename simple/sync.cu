/*
Lessons: 
1. Generally all of the kernel calls in CUDA are async to allow both CPU and GPU to work concurrently. 
2. cudaDeviceSynchronize() blocks the CPU to wait till GPU has completed execution. Thus, print_from_gpu is always
visibile when it is used. 
3. When sync() call is removed, the GPU print might not be visible. 
*/

#include<stdio.h>
#include<stdlib.h>

__global__ void print_from_gpu(){
    printf("Hello from GPU, thread[%d, %d]\n", threadIdx.x, blockIdx.x);
}

int main(){
    
    printf("Hello from HOST! \n");
    print_from_gpu<<<1,1>>>();
    cudaDeviceSynchronize();
    return 0;
}