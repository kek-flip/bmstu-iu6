#include <iostream>
#include <string>
#include "complex.h"

using namespace std;

typedef enum {
    INT_MODE,
    REAL_MODE
} mode;

int main() {
    int choice = -1;
    mode mode = INT_MODE;

    cout << endl << "=============Welcome to complex number calculator=============" << endl << endl;

    const string menu = "Choose action:\n1: addition\n2: subtraction\n3: multiplication by a scalar\n4: change mode\n0: exit";

    while (choice != 0) {
        cout << menu << endl;
        cin >> choice;
        switch (choice) {
        case 1: 
        {
            double rePart1 = 0, imPart1 = 0;
            double rePart2 = 0, imPart2 = 0;

            cout << "Input first num`s real part: ";
            cin >> rePart1;

            cout << "Input first num`s imaginary part: ";
            cin >> imPart1;

            cout << "Input second num`s real part: ";
            cin >> rePart2;

            cout << "Input second num`s imaginary part: ";
            cin >> imPart2;

            if (mode == INT_MODE) {
                complex<int> num1(rePart1, imPart1);
                complex<int> num2(rePart2, imPart2);

                complex<int> res = num1 + num2;
                
                cout << "(" << num1 << ") + (" << num2 << ") = " << res << endl << endl;
            } else {
                complex<double> num1(rePart1, imPart1);
                complex<double> num2(rePart2, imPart2);

                complex<double> res = num1 + num2;
                
                cout << "(" << num1 << ") + (" << num2 << ") = " << res << endl << endl;
            }
        }
            break;
        case 2: 
        {
            double rePart1 = 0, imPart1 = 0;
            double rePart2 = 0, imPart2 = 0;

            cout << "Input first num`s real part: ";
            cin >> rePart1;

            cout << "Input first num`s imaginary part: ";
            cin >> imPart1;

            cout << "Input second num`s real part: ";
            cin >> rePart2;

            cout << "Input second num`s imaginary part: ";
            cin >> imPart2;

            if (mode == INT_MODE) {
                complex<int> num1(rePart1, imPart1);
                complex<int> num2(rePart2, imPart2);

                complex<int> res = num1 - num2;
                
                cout << "(" << num1 << ") - (" << num2 << ") = " << res << endl << endl;
            } else {
                complex<double> num1(rePart1, imPart1);
                complex<double> num2(rePart2, imPart2);

                complex<double> res = num1 - num2;
                
                cout << "(" << num1 << ") - (" << num2 << ") = " << res << endl << endl;
            }
        }
            break;
        case 3: 
        {
            double rePart = 0, imPart = 0, scalar;

            cout << "Input num`s real part: ";
            cin >> rePart;

            cout << "Input num`s imaginary part: ";
            cin >> imPart;

            cout << "Input scalar: ";
            cin >> scalar;

            if (mode == INT_MODE) {
                complex<int> num(rePart, imPart);
                complex<int> res(rePart, imPart);
                res.scalMult(scalar);
                cout << "(" << num << ") * " << scalar << " = " << res << endl << endl;
            } else {
                complex<double> num(rePart, imPart);
                complex<double> res(rePart, imPart);
                res.scalMult(scalar);
                cout << "(" << num << ") * " << scalar << " = " << res << endl << endl;
            }
        }

            break;
        case 4: 
        {
            if (mode == INT_MODE) {
                mode = REAL_MODE;
                cout << "Mode has been changed to real nums" << endl << endl;
            } else {
                mode = INT_MODE;
                cout << "Mode has been changed to integer nums" << endl << endl;
            }
        }

            break;
        case 0:
            cout << "Program has been finished" << endl << endl;

            break;
        default:
            cout << "Unknown command" << endl << endl;

            break;
        }
    }
}