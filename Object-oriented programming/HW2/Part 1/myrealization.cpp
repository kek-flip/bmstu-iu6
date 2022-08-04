#include "myrealization.h"

#include <QByteArray>
#include <string.h>
#include <stdlib.h>

int wordCount(QString s) {
    int res = 0;
    for (int i = 0; i < s.length(); i++) {
        if (s[i] == ' ') res++;
    }
    return res + 1;
}

bool insert(QString &s, int i, char c) {
    int charCount = s.size();
    QByteArray ba = s.toLocal8Bit();
    char *c_str = ba.data();
    char *tmp = (char*)malloc(charCount + 1);
    memmove(tmp, c_str, charCount);
    if (tmp == NULL) return false;
    c_str = tmp;
    memmove(c_str + i + 2, c_str + i + 1, charCount - i - 1);
    c_str[i + 1] = c;
    s = QString(c_str);
    free(c_str);
    if (s.isEmpty()) return false;
    s.resize(charCount + 1);
    return true;
}
