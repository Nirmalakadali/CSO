#include <stdio.h>
#define ll long long int

extern ll divide(ll M, ll N);
extern ll rem(ll M, ll N);

/*
ll divide(ll a, ll b)
{
    ll q = 0;
    while (a >= b)
    {
        a = a - b;
        q++;
    }
    return q;
}

ll rem(ll a, ll b)
{
    while (a >= b)
    {
        a = a - b;
    }
    return a;
}
*/

int main()
{
    ll M, N;
    scanf("%lld %lld", &M, &N);
    ll q = divide(M, N);
    ll r = rem(M, N);
    printf("%lld %lld\n", q, r);
    return 0;
}