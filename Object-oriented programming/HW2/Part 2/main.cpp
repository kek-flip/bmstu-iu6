#include <QTextStream>
#include <QFile>

#include <algorithm>
#include <stdio.h>
#include <string>
#include <ctime>

#include "myhashtable.h"

using namespace Qt;

bool comp(QPair<QString, int> a, QPair<QString, int> b) {
    return a.second < b.second;
}

int main() {
    QTextStream in(stdin);
    QTextStream out(stdout);

    myHashTable table;
    const QString fileDir = "C:\\Users\\normp\\Documents\\Programming\\2 sem\\HW2\\Part 2\\files\\";

    QString fileName;
    printf("Input file name: ");
    in >> fileName;

    unsigned int start = clock();

    QFile F(fileDir + fileName);
    if (!F.exists()) {
        out << "File doesn`t exist" << endl;
        return 1;
    }
    F.open(QIODevice::ReadOnly);

    while (!F.atEnd()) {
        QString buf = F.readLine();
        QString cleanedBuf;
        for (int i = 0; i < buf.length(); i++) {
            if (buf[i] == ' ' || buf[i] == '-' || buf[i].isLetter()) {
                cleanedBuf += buf[i];
            }
        }
        QStringList words = cleanedBuf.split(" ");
        foreach (QString i, words) {
            if (i == "") {
                continue;
            }
            table.insert(i);
        }
    }
    F.close();

    QFile output(fileDir + "words.txt");
    output.open(QIODevice::WriteOnly);
    table.putWordsInFile(output);
    out << "Writing words in file has been finished" << endl;
    output.close();

    QFile sortedOutput(fileDir + "sorted words.txt");
    sortedOutput.open(QIODevice::WriteOnly);
    QList<QPair<QString, int>> data = table.getData();
    sort(data.begin(), data.end(), comp);
    for (int i = 0; i < data.size(); i++) {
        QString word = data[i].first;
        QByteArray ba = (word + " " + QString::number(data[i].second)).toLocal8Bit();
        sortedOutput.write(ba);
        sortedOutput.write("\n");
    }
    out << "Sorting words has finished" << endl;
    sortedOutput.close();

    unsigned int end = clock();
    out << "Time: " << end - start << endl;
}
