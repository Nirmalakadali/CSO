#include <stdio.h>
extern int primecheck(int N);
int main()
{
    int N;
    scanf("%d",&N);
    int M=primecheck(N);
    printf("%d\n",M);
    return 0;
}