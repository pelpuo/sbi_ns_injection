#include <stdio.h>

char *global_str = "Global String\n";
const char *const global_const_str = "Global Const String\n";
int global_arr[] = {1, 2, 3, 4, 5};

int main(void) {
    char *local_str = "Local String\n";
    int local_arr[] = {6, 7, 8, 9, 10};

    int empty_arr[5];
    char *empty_str[10];

    printf("%s", global_str);
    printf("%s", local_str);

    printf("%d\n", global_arr[0]);
    printf("%d\n", local_arr[0]);
    
    return 42;
}