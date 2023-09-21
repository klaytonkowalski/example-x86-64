#include <stdio.h>

// asmSum() found in file: 14-3_2.s
extern int asmSum(int* list, int length);

void main(void)
{
    int list[] = { 1, 2, 3, 4, 5 };
    int length = 5;
    int sum = asmSum(list, length);
    printf("Sum: %d\n", sum);
}