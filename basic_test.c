// int alt(){
//     return 10;
// }

// int main(){
//     int x;
//     x = alt();
//     printf("%d\n", x);
//     return x;
// }

#include <stdio.h>

int fib(int n) {
    if (n <= 1)
        return n;
    return fib(n - 1) + fib(n - 2);
}

int main() {
    int n = 10; // Example: Calculate the 10th Fibonacci number
    printf("Fibonacci number at position %d is %d\n", n, fib(n));
    return 0;
}