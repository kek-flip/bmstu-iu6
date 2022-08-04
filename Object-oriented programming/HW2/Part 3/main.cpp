#include <QTextStream>
#include <QList>
#include <QVector>
#include <QMap>
#include <iostream>

#include "expression.h"

using namespace Qt;

int main() {
    QTextStream in(stdin);
    QTextStream out(stdout);

    QVector<expression> mas;
    QList<expression> list;
    QMap<int, int> tree;
    QString buf;

    int n;
    std::cout << "Input number of expressions: ";
    in >> n;
    in.readLine();
    std::cout << "Input expressions: " << std::endl;
    for (int i = 0; i < n; i++) {
        buf = in.readLine();
        if (expression::isValid(buf)) {
            expression tmpExp(buf);
            mas.push_back(tmpExp);
            list.push_back(tmpExp);
            tree.insert(tmpExp.numSum(), i);
        } else {
            out << "You`ve input invalid expression" << endl;
            return 1;
        }
    }

    int sum = 0;
    foreach(expression i, mas) {
        sum += i.getOperationCount();
    }
    out << "Count of operations for all expressions: " << sum << endl << endl;

    std::cout << "Input sum of numbers to find expression: ";
    in >> sum;
    if(tree.find(sum) != tree.end()) {
        out << "Sum is " << sum << endl;
        out << "Position in array is " << tree.find(sum).value() << endl;
        out << "Expression is " << mas[tree.find(sum).value()].getExp() << endl;
    } else {
        out << "There isn`t expression with this sum" << endl;
    }
}
