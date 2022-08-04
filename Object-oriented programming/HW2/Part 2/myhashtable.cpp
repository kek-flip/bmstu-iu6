#include "myhashtable.h"

#include <QByteArray>

myHashTable::myHashTable() {
    data.resize(65536);
}

int& myHashTable::operator[](QString key) {
    unsigned short index = crc16(key);
    for (int i = 0; i < data[index].size(); i++) {
        if (data[index].at(i).first == key) {
            return data[index][i].second;
        }
    }
}

unsigned short myHashTable::crc16(QString key) {
    unsigned short crc = 0xFFFF;
    QByteArray ba = key.toLocal8Bit();
    char *c_str = ba.data();
    int len = key.size();
    while (len--) {
        crc ^= *c_str;
        for (int i = 0; i < 8; i++) {
            if (crc & 1) {
                crc >>= 1;
                crc ^= 0x8005;
            } else {
                crc >>= 1;
            }
        }
        c_str++;
    }
    return crc;
}

void myHashTable::insert(QString key) {
    unsigned short index = crc16(key);
    bool isFind = false;
    for (int i = 0; i < data[index].size() && !isFind; i++) {
        if (data[index].at(i).first == key) {
            data[index][i].second += 1;
            isFind = true;
        }
    }
    if (!isFind) {
        data[index].append(qMakePair(key, 1));
    }
}

void myHashTable::putWordsInFile(QFile &file) {
    for (int i = 0; i < 65536; i++) {
        for (int j = 0; j < data[i].size(); j++) {
            QString word = data[i][j].first;
            QByteArray ba = (word + " " + QString::number(data[i][j].second)).toLocal8Bit();
            file.write(ba);
            file.write("\n");
        }
    }
}

QList<QPair<QString, int>> myHashTable::getData() {
    QList<QPair<QString, int>> d;
    for (int i = 0; i < 65536; i++) {
        for (int j = 0; j < data[i].size(); j++) {
            d.append(data[i][j]);
        }
    }
    return d;
}
