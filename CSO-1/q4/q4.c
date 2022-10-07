#include <stdio.h>
#define ll long long int

extern ll lpf(ll N);

/*
ll lpf(ll N)
{
   if (N == 1)
      printf("1\n");
   ll div = 2, M;
   while (N != 0)
   {
      if (N % div != 0)
         div = div + 1;
      else
      {
         M = N;
         N = N / div;
         if (N == 1)
         {
            return M;
         }
      }
   }
   return -1;
}
*/

int main()
{
   ll N, M;
   scanf("%lld", &N);
   M = lpf(N);
   printf("%lld\n", M);
   return 0;
}