#include <QTextStream>
#include <iostream>
#include <algorithm>

#include "mystack.h"

using namespace Qt;

int main()
{
    QTextStream in(stdin);
    QTextStream out(stdout);

    mystack<char> charStack;
    mystack<int> intStack;

    charStack.push('a');
    charStack.push('b');
    charStack.push('c');
    out << "Stack of chars: " << endl;
    charStack.print();
    out << endl;

    intStack.push(12);
    intStack.push(4);
    intStack.push(1002);
    out << "Stack of integers: " << endl;
    intStack.print();
    out << endl;

    mysortstack<char> charSortStack;
    mysortstack<int> intSortStack;

    charSortStack.push('a');
    charSortStack.push('b');
    charSortStack.push('c');
    out << "Stack of chars before sort: " << endl;
    charSortStack.print();
    charSortStack.sort();
    out << "Stack of chars after sort: " << endl;
    charSortStack.print();
    out << endl;

    intSortStack.push(12);
    intSortStack.push(4);
    intSortStack.push(1002);
    out << "Stack of chars before sort: " << endl;
    intSortStack.print();
    intSortStack.sort();
    out << "Stack of chars after sort: " << endl;
    intSortStack.print();
}
