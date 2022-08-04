#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QWidget>
#include <QTextEdit>
#include <QLineEdit>
#include <QPushButton>
#include <QString>

class mainwindow : public QWidget
{
    Q_OBJECT
public:
    mainwindow();
    virtual ~mainwindow() = default;
protected:
    QString str;
    QPushButton *button;
    QLineEdit *lineEdit;
    QTextEdit *textEdit;

    bool isUpper;
private slots:
    void changeRegister();
    void outputString();
};

#endif // MAINWINDOW_H
