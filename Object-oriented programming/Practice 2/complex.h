#ifndef COMPLEX_H
#define COMPLEX_H

#include <cmath>

template <class T>
class complex;

template<typename T>
complex<T> operator+(const complex<T>& num1, const complex<T>& num2) {
    return complex(num1.re + num2.re, num1.im + num2.im);
}

template<typename T>
std::ostream& operator<<(std::ostream &out, const complex<T>& num) {
        out.precision(5);
        out << num.re << (num.im > 0 ? " + " : "") << num.im << "i";
        return out;
}

template <typename T>
complex<T> operator-(const complex<T>& num1, const complex<T>& num2) {
        return complex(num1.re - num2.re, num1.im - num2.im);
}

template <class T>
class complex {
    T re;
    T im;
public:
    complex() = default;

    complex(T re, T im) {
        this->re = re;
        this->im = im;
    }

    friend std::ostream& operator<<<T>(std::ostream &out, const complex<T>& num);

    friend complex operator+<T>(const complex<T>& num1, const complex<T>& num2);

    friend complex operator-<T>(const complex<T>& num1, const complex<T>& num2);

    void scalMult(int c) {
        re *= c;
        im *= c;
    }
};

#endif