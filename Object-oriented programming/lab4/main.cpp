#include <iostream>
#include <string>
#include <stack>

using namespace std;

char closeBracket(char a)
{
    if (a == '(') return ')';
    if (a == '[') return ']';
    if (a == '{') return '}';
}


int main()
{
    string s;
    cout << "Input text: "; getline(cin, s);

    stack<char> openBrackets;
    bool isCorrect = true;

    for (int i = 0; i < s.length() && isCorrect; i++)
    {
        if (s[i] == '(' || s[i] == '{' || s[i] == '[')
            openBrackets.push(s[i]);

        if (s[i] == ')' || s[i] == '}' || s[i] == ']')
        {
            if (openBrackets.empty() || s[i] != closeBracket(openBrackets.top()))
                isCorrect = false;
            else
                openBrackets.pop();
        }
    }



    char *secondBracketOpen = nullptr, *secondBracketClose = nullptr;

    for (int i = 0, kOpen = 0, kClose = 0; i < s.length() && isCorrect && (kOpen < 2 || kClose < 2); i++)
    {
        if (s[i] == '(' || s[i] == '{' || s[i] == '[')
        {
            kOpen++;
            if (kOpen == 2)
                secondBracketOpen = &s[i];
        }

        if (s[s.length() - i] == ')' || s[s.length() - i] == '}' || s[s.length() - i] == ']')
        {
            kClose++;
            if (kClose == 2)
                secondBracketClose = &s[s.length() - i];
        }
    }



    if (isCorrect)
    {
        cout << "Brackets are placed correctly" << endl;

        if (secondBracketOpen != nullptr)
        {
            if (secondBracketOpen == secondBracketClose - 1)
               cout << "There are no lements between second opening and closing brackets" << endl;

            else
            {
                cout << "Adresses of elements between second opening and closing brackets: " << endl;

                for (char *i = secondBracketOpen + 1; i != secondBracketClose; i++)
                    cout << (int*)i << " - '" << *i << "'" << endl;
            }
        }
    }
    else
        cout << "There are some mistakes";

    return 0;
}
