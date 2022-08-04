#ifndef MYSTACK_H
#define MYSTACK_H

#include <iostream>

template <class T>
struct item{
    T val;
    item *p;
};

template <class T>
class mystack {
protected:
    item<T> *head;
public:
    mystack() {
        head = new item<T>;
        head->val = 0;
        head->p = nullptr;
    }
    void push(T el) {
        item<T> *tmp = new item<T>;
        tmp->p = head;
        tmp->val = el;
        head = tmp;
    }
    void pop() {
        item<T> *tmp = head->p;
        delete head;
        head = tmp;
    }
    void print() {
        item<T> *i = head;
        while(i->p != nullptr) {
            std::cout << i->val << ' ';
            i = i->p;
        }
        std::cout << std::endl;
    }
    ~mystack() {
        item<T> *i = head;
        item<T> *tmp;
        while(i != nullptr) {
            tmp = i;
            i = i->p;
            delete tmp;
        }
    }
};

template <class T>
class mysortstack : public mystack<T> {
public:
    void sort() {
        bool isSwap = true;
        while (isSwap) {
            isSwap = false;
            item<T> *i = mystack<T>::head;
            while(i->p->p != nullptr) {
                if(i->val > i->p->val) {
                    T tmp = i->val;
                    i->val = i->p->val;
                    i->p->val = tmp;
                    isSwap = true;
                }
                i = i->p;
            }
        }
    }
};

#endif // MYSTACK_H
