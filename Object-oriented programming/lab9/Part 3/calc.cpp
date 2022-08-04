#include <QApplication>
#include "calcDialog.h"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    CalcDialog *dialog = new CalcDialog();

    dialog->show();    // отображаем окно
    return app.exec(); // запускаем цикл обработки сообщений
}