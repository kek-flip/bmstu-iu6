#include <stdio.h>
#include <climits>

using namespace std;

int isFactOfThreeNums(int n)
{
    int res = 1;
    int i = 2;
    for( ; res < n; i++)
        res *= i;
    return (res == n) ? (i - 1) : -1;
}

int main()
{
    int n1 = 1, n2 = 2, n3 = 3;
    int count = 0;

    while (n3 <= 1276)
    {
        int a = isFactOfThreeNums(n1 * n2 * n3);
        if (a > 0)
        {
            printf("Factorial of %d equals %d * %d * %d\n", a, n1, n2, n3);
            count++;
        }
        //else
            //printf("%d * %d * %d = %d is not factorial\n", n1, n2, n3, n1 * n2 * n3);

        n1++;
        n2++;
        n3++;

    }

    printf("There are only %d such factorials\n", count);

    return 0;
}
