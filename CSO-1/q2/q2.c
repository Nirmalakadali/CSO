#include <stdio.h>
//calling external GCD function
extern long long int GCD(long long int a, long long int b);

int main()
{
  long long int M, N;
  scanf("%lld %lld", &M, &N);
  
  printf("%lld\n", GCD(M, N));

  return 0;
}