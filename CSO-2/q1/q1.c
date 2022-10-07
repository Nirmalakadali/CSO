#include <stdio.h>
extern void Next_Greatest_element(long long int input_array[],long long int output_array[],long long int size);
int main()
{
    long long int size;
    scanf("%lld", &size);
    long long int input[size];
    long long int i=0;
    while(i<size)
    {
        scanf("%lld", &input[i]);
        i++;
    }
    long long int output[size];
    Next_Greatest_element(input,output,size);
    printf("[ ");
    i=0;
    while(i<size)
    {
        if(output[i] != -1)
        {
            printf("%lld ", input[output[i]]);
        }
        else
        {
            printf("-1 ");   
        }
        i++;
    }
    printf(" ]");
    printf("\n");
    return 0;
}