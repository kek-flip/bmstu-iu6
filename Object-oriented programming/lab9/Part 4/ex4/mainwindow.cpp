#include "mainwindow.h"

#include <QVBoxLayout>

mainwindow::mainwindow()
{
    button = new QPushButton("Convert");
    lineEdit = new QLineEdit();
    textEdit = new QTextEdit();

    QVBoxLayout *layout = new QVBoxLayout();
    layout->addWidget(lineEdit);
    layout->addWidget(button);
    layout->addWidget(textEdit);
    setLayout(layout);

    connect(lineEdit, SIGNAL(editingFinished()) , this, SLOT(outputString()));
    connect(button, SIGNAL(clicked()), this, SLOT(changeRegister()));

    isUpper = true;
}

void mainwindow::outputString() {
    str = lineEdit->text();
    textEdit->append("input: " + str);
}

void mainwindow::changeRegister() {
    QString msg;
    if (isUpper) {
        str = str.toUpper();
        msg = "ALL UPPER: ";
        isUpper = false;
    } else {
        str = str.toLower();
        msg = "all lower: ";
        isUpper = true;
    }
    textEdit->append(msg + str);
}
