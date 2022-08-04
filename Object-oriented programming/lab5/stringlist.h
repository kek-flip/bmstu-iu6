#ifndef STRINGLIST_H
#define STRINGLIST_H

#include <string>

using namespace std;


struct element
{
    string val;
    element* p;
};


class stringList
{
private:
    element* first;
    element* last;
public:
    stringList(string value = "");
    ~stringList();
    void pushFront(string e);
    void pushBack(string e);
    void sort();
    element* getFirstP() { return first; }
    element* getLastP() { return last; }
};

#endif // STRINGLIST_H
