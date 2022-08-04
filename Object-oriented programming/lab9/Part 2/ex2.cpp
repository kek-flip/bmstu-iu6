#include "dialogex2.h"
#include <QApplication>
#include <QSplitter>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    QSplitter *splitter = new QSplitter(Qt::Vertical);
    DialogEx2 *dialog1 = new DialogEx2();
    DialogEx2 *dialog2 = new DialogEx2();
    splitter->addWidget(dialog1);
    splitter->addWidget(dialog2);
    splitter->show();
    ;

    return app.exec(); // запускаем цикл обработки сообщений
}
