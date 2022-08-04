#include "multtable.h"

MultTable::MultTable() {
    QFile file("C:\\Users\\normp\\Documents\\Programming\\2 sem\\HW3\\Part3New\\colorFile.txt");
    file.open(QIODevice::ReadOnly);
    QTextStream in(&file);
    QString temp;
    while (!in.atEnd()) {
        bool flag = true;
        in >> temp;
        if (temp == "") {
               flag = false;
           }
        if (flag) {
            list.push_back(temp);
        }
    }
    file.close();
}

void MultTable::save() {
    QFile file(".\\colorFile.txt");
    file.open(QIODevice::WriteOnly | QIODevice::Truncate);
    QTextStream out(&file);

    for (unsigned int i = 0; i < list.size(); ++i) {
        QString save =list[i] + "\n";
        out << save;
    }
    file.close();
}

