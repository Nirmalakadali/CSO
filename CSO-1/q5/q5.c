#include <stdio.h>
#include <limits.h>
//calling external function which was written in assmebly code
extern long long int sumofsquares(long long int N);

int main()
{
    long long int N, sum;
    scanf("%lld",&N);
    sum = sumofsquares(N);
    printf("%lld\n",sum%LLONG_MAX);
}
