
// lab4.c
// avery wald

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

// function prototype
unsigned long calcFac(int val);

// driver function
int main() {
    int table[9] = {0, 1, 2, 3, 6, 7, 8, 9, 10};
    unsigned long factorials[9];

    for(int i = 0; i < 9; i++) {
        printf("\n%d: %d => ", i, table[i]);
        factorials[i] = calcFac(table[i]);
        printf("%lu", factorials[i]);
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