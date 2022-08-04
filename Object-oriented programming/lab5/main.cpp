#include <iostream>
#include <algorithm>
#include <string>
#include <ctype.h>

#include "stringlist.h"

using namespace std;

bool isVowel(char n)
{
    n = tolower(n);
    if (n == 'a' || n == 'e' || n == 'i' || n == 'o' || n == 'u' || n == 'y')
        return true;
    else
        return false;
}

int main()
{
    string s;

    cout << "Input string: "; getline(cin, s);
    cout << endl;

    stringList even, odd;
    int wordNum = 1;
    string word = "";

    for(int i = 0; i <= s.length(); i++)
    {
        if (s[i] == ' ' || i == s.length())
        {
            if (wordNum % 2 == 0)
                even.pushBack(word);
            else
                odd.pushBack(word);

            word.clear();
            wordNum++;
        }
        else
            word += s[i];
    }

    even.sort();
    odd.sort();

    cout << "Sorted lists: " << endl << endl;

    element* i;
    int evenV = 0, oddV = 0;

    cout << "Odd words: ";

    i = odd.getFirstP();
    while (i != nullptr)
    {
        cout << i->val << " ";
        if (isVowel(i->val[0]))
            oddV++;
        i = i->p;
    }
    cout << endl <<"Words starting with vowels: " << oddV << endl << endl;

    cout << "Even words: ";

    i = even.getFirstP();
    while (i != nullptr)
    {
        cout << i->val << " ";
        if (isVowel(i->val[0]))
            evenV++;
        i = i->p;
    }
    cout << endl <<"Words starting with vowels: " << evenV << endl << endl;

    if (oddV > evenV)
        cout << "There are more words starting with vowels in the odd list(" << oddV <<") than in even list(" << evenV << ")" << endl;
    else
        cout << "There are more words starting with vowels in the even list(" << evenV <<") than in odd list(" << oddV << ")" << endl;

    return 0;
}
