#include <iostream>
#include <string>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

void displayPermutation(string permutation[], int length){
    int i;
    for (i=0;i<length;i++){
        cout<<permutation[i];
    }
    cout << endl;
}

void getPermutations(string operatorBank[], int operatorCount, 
        string permutation[],int permutationLength, int curIndex){
    int i;
    //stop recursion condition
    if(curIndex == permutationLength){
        displayPermutation(permutation,permutationLength);
    }
    else{
        for(i = 0; i < operatorCount; i++){
            permutation[curIndex] = operatorBank[i];
            getPermutations(operatorBank,operatorCount,permutation,
                    permutationLength,curIndex+1);
        }
    }
}

int main ()
{
    int operatorCount = 10;
    int permutationLength = 9;
    string operatorBank[] = {"8 ", "3 ", "10 ", "9 ", "1 ", "0 ", "2 ", "4 ", "7 ", "11 "};

    string permutation[] = {"","","","","","","","","",""}; //empty string
    int curIndex = 0;
    getPermutations(operatorBank,operatorCount,permutation,
            permutationLength,curIndex);
    return 0;
}
