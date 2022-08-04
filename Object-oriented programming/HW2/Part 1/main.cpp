#include <QTextStream>
#include <QString>
#include <QList>
#include <iostream>
#include <ctime>

#include "myrealization.h"

using namespace Qt;

int main() {
    QTextStream in(stdin);
    QTextStream out(stdout);

    QStringList slist;
    int n;
    std::cout << "Input number of string: ";
    in >> n;
    in.readLine();
    out << "Input strings: " << endl;
    for (int i = 0; i < n; i++) {
        QString s;
        s = in.readLine();
        slist.append(s);
    }
    int stringWidth = 0;
    std::cout << "Input strings` width: ";
    in >> stringWidth;


    unsigned int start = clock();
    foreach(QString s, slist) {

        if (stringWidth < s.length()) {
            std::cout << "Width is less than string length" << std::endl;
            continue;
        }

        int spaceCount = stringWidth - s.length();

        int gapCount = wordCount(s) - 1;
        //QStringList words = s.split(" ");
        //int gapCount = words.size() - 1;

        int spacePerGap = spaceCount / gapCount;
        int delta = spaceCount - (spacePerGap * gapCount);

        for(int i = 0; i < s.length() - 1; i++) {
            if (s[i + 1] == ' ') {
                if (delta > 0) {
                    insert(s, i + 1, ' ');
                    //s.insert(i + 1, ' ');
                    delta--;
                }
                for (int j = 0; j < spacePerGap; j++) {
                    insert(s, i + 1, ' ');
                    //s.insert(i + 1, ' ');
                }
                i++;
                while (!s[i].isLetter()) {
                    i++;
                }
                i--;
            }
        }

        out << "Edited string: " << s << endl;
    }
    unsigned int end = clock();
    out << "Time: " << end - start << endl;
}
