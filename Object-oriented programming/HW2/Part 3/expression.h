#ifndef EXPRESSION_H
#define EXPRESSION_H

#include <QString>

class expression
{
private:
    QString exp;
    int operationCount;
public:
    expression();
    expression(QString str);
    static bool isOperation(QChar c);
    static bool isValid(QString str);
    int getOperationCount();
    int numSum();
    QString getExp();
};

#endif // EXPRESSION_H
