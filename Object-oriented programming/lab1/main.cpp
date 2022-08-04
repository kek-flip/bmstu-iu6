#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

string convertToString(int n)
{
    string s = "";
    int a = 0;
    while (n != 0)
    {
        a = n % 10;
        s += (char)(a + '0');
        n /= 10;
    }
    reverse(s.begin(), s.end());
    return s;
}

bool isPalindrom(int n)
{
    string s = convertToString(n);
    for (int i = 0; i < s.length() / 2; i++)
    {
        if (s[i] != s[s.length() - 1 - i])
            return false;
    }
    return true;
}

int main()
{
    cout << "Palindrom squares:" << endl;
    for (int i = 0; i <= 500; i++)
    {
        if (isPalindrom(i * i))
            cout << i << " * " << i << " = " << i * i << " - this is palindrom" << endl;
    }
    return 0;
}

