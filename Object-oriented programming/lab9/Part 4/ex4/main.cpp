#include <QApplication>
#include "mainwindow.h"

int main(int argc, char *argv[]) {
    QApplication a(argc, argv);

    mainwindow* win = new mainwindow();
    win->show();

    return a.exec();
}
