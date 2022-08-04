#ifndef MYHASHTABLE_H
#define MYHASHTABLE_H

#include <QString>
#include <QList>
#include <QVector>
#include <QPair>
#include <QFile>


class myHashTable {
private:
    QVector<QList<QPair<QString, int>>> data;
public:
    myHashTable();
    int &operator[](QString key);
    static unsigned short crc16(QString key);
    void insert(QString key);
    void putWordsInFile(QFile &file);
    QList<QPair<QString, int>> getData();
};

#endif // MYHASHTABLE_H
