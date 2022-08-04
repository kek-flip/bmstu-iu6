#include "expression.h"

#include <QList>

expression::expression() {
    operationCount = 0;
}

expression::expression(QString str) {
    operationCount = 0;
    exp = str;
    for (int i = 0; i < str.length(); i++) {
        if (expression::isOperation(str[i])) {
            operationCount++;
        }
    }
}

bool expression::isOperation(QChar c) {
    if (c == '+' || c == '-' || c == '*' || c == '/') {
        return true;
    } else {
        return false;
    }
}

bool expression::isValid(QString str) {
    bool isValid = true;
    int digitCount = 0;
    for(int i = 0; i < str.length() && isValid; i++) {
        if (!str[i].isDigit() && !expression::isOperation(str[i])) {
            isValid = false;
        } else if (str[i].isDigit()) {
            digitCount++;
        }
    }
    if (digitCount == 0) {
        isValid = false;
    }
    return isValid;
}

int expression::getOperationCount() {
    return operationCount;
}

int expression::numSum() {
    QString expCopy = exp;
    for (int i = 0; i < expCopy.length(); i++) {
        if (isOperation(expCopy[i])) {
            expCopy[i] = ' ';
        }
    }
    QStringList nums = expCopy.split(" ");
    int sum = 0;
    foreach(QString i, nums){
        sum += i.toInt();
    }
    return sum;
}

QString expression::getExp() {
    return exp;
}
