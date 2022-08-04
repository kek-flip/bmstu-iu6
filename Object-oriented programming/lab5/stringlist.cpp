#include "stringlist.h"

stringList::stringList(string value)
{
    first = new element;
    first->val = value;
    first->p = nullptr;
    last = first;
}

stringList::~stringList()
{
    element* i = first;
    while(first != last)
    {
        first = first->p;
        delete i;
        i = first;
    }
    delete first;
}

void stringList::pushFront(string e)
{
    if (first->val != "")
    {
        element* buf = new element;
        buf->val = e;
        buf->p = first;
        first = buf;
    }
    else
    {
        first->val = e;
    }
}

void stringList::pushBack(string e)
{
    if (first->val != "")
    {
        last->p = new element;
        last->p->val = e;
        last = last->p;
        last->p = nullptr;
    }
    else
    {
        first->val = e;
    }
}


void stringList::sort()
{
    element* i = first;

    while(i != last)
    {
        element* j = i;
        element* min = j;
        while (j != nullptr)
        {
            if (j->val < min->val)
                min = j;
            j = j->p;
        }
        swap(min->val, i->val);
        i = i->p;
    }
}
