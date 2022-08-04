#ifndef MULTTABLE_H
#define MULTTABLE_H

#include <QFile>
#include <QTextStream>
#include <QStringList>
class MultTable
{
public:
    std::vector<QString> list;
    MultTable();
    void save();
};

#endif // MULTTABLE_H
