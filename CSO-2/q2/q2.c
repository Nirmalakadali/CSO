#include <stdio.h>
#include <stdlib.h>
int n;
int res = 0;
extern int Answer(int F, int S);
/*
{
    // We can't cover difference of more
    // than n with 2n bits
    if (abs(S) > F)
        return 0;
 
    // n == 1, i.e., 2 bit long sequences
    if (F == 1 && S == 0)
        return 2;
    if (F == 1 && abs(S) == 1)
        return 1;
 
    int res = // First bit is 0 & last bit is 1
              Answer(F-1, S+1) +
 
              // First and last bits are same
              Answer(F-1, S) +
 
              // First bit is 1 & last bit is 0
              Answer(F-1, S-1) + Answer(F-1, S);
 
    return res;
}*/
 
int main()
{

  scanf("%d", &n);
  int ans = 0;
  ans += Answer(n, 0);
  printf("%d\n", ans);
}