
// lab4.c
// avery wald

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define SENTINEL 11

// function prototype
unsigned long calcFac(int val);

// driver function
int main() {
    int table[12] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, SENTINEL};
    unsigned long factorials[11];
    int i = 0;
    while(i != SENTINEL) {
        printf("\n%d: %d => ", i, table[i]);
        factorials[i] = calcFac(table[i]);
        printf("%lu", factorials[i]);
        i++;
    }

    printf("\n");
    return 0;
}

// function definition
unsigned long calcFac(int val) {
    int i, factorial = 1;
    int j, partialSum = 0;
    while(i < val) {
        j = 0;
        partialSum = factorial;
        while(j < i) {
            factorial += partialSum;
            j++;
        }
        i++;
    }
    return factorial;
}