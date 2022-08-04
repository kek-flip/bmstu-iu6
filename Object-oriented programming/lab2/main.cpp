#include <iostream>
#include <time.h>
#include <algorithm>

using namespace std;

void swapMaxAndDig(int a[][100], int n)
{
    for (int j = 0; j < n; j++)
    {
        int max = 0;
        int maxi = 0;
        for (int i = 0; i < n; i++)
        {
            if(a[i][j] > max)
            {
                max = a[i][j];
                maxi = i;
            }
        }
        swap(a[j][j], a[maxi][j]);
    }
}

int main()
{
    srand(time(NULL));

    int n;
    cout << "Input size of matrix (<100): "; cin >> n;


    int a[100][100] = {};
    cout << "The matrix:" << endl;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
           a[i][j] = rand() % 100 + 1;
           cout << a[i][j] << " ";
        }
        cout << endl;
    }
    cout << endl << "========================" << endl << endl;


    swapMaxAndDig(a, n);
    cout << "Changed matrix: " << endl;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
            cout << a[i][j] << " ";
        cout << endl;
    }
    cout << endl << "========================" << endl << endl;

    cout << "Elements by spiral: " << endl;
    bool isPrinted[100][100] = {};
    int i = 0, j = 0;
    int k = 0;
    while (k < n * n)
    {
        for( ; i < n && !isPrinted[i][j]; i++)
        {
            cout << a[i][j] << " ";
            isPrinted[i][j] = true;
            k++;
        }
        i--;
        j++;

        for( ; j < n && !isPrinted[i][j]; j++)
        {
            cout << a[i][j] << " ";
            isPrinted[i][j] = true;
            k++;
        }
        j--;
        i--;

        for( ; i >= 0 && !isPrinted[i][j]; i--)
        {
            cout << a[i][j] << " ";
            isPrinted[i][j] = true;
            k++;
        }
        i++;
        j--;

        for( ; j >= 0 && !isPrinted[i][j]; j--)
        {
            cout << a[i][j] << " ";
            isPrinted[i][j] = true;
            k++;
        }
        j++;
        i++;
    }

    return 0;
}
