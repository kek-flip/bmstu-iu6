#include <iostream>
#include <map>
#include <vector>
#include <stdlib.h>
#include <ctime>

#include <QTextStream>
#include <QMap>
#include <QString>
#include <QFile>

using namespace Qt;

struct myComp {
    bool operator() (const QString& a, const QString& b) const {
        return a.toLower() < b.toLower();
    }
};

int main() {
    unsigned int start = clock();

    srand(time(NULL));

    QFile in("C:\\Users\\normp\\Documents\\Programming\\2 sem\\HW2\\Part 2\\files\\prestuplenie-i-nakazanie.txt");
    in.open(QIODevice::ReadOnly);
    QTextStream out(stdout);

    std::map<QString, std::vector<int>, myComp> cppMap;

    //QMap<QString, std::vector<int>> qtMap;
    //QMap<QString, QString> crutchComp;

    QString buf;
    while (!in.atEnd()) {
        buf = in.readLine();

        std::vector<int> mas(100);
        for (int j = 0; j < 100; j++) {
            mas[j] = rand() % 2001 + 11000;
        }

        cppMap.insert(make_pair(buf, mas));

        //crutchComp.insert(buf, buf.toLower());
        //qtMap.insert(buf.toLower(), mas);

    }

    unsigned int end = clock();

    out << "Time: " << end - start << endl;
}
