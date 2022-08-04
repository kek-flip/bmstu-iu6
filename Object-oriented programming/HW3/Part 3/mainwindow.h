#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QColorDialog>
#include <QColor>
#include <QTextEdit>
#include "multtable.h"
#include <QDebug>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void updateTable(MultTable multTable, QColor color, int index);
    bool isSimple(int number);
    std::array<int, 3> parser(QString expression);
    void caseHandler(std::array<int, 3> numbers, bool (*f)(int), QTextEdit *edit);

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_saveButton_clicked();

    void on_saveButton_2_clicked();

    void on_saveButton_3_clicked();

    void on_saveButton_4_clicked();

private:
    Ui::MainWindow *ui;
    QColor color;
    MultTable multTable;
};
#endif // MAINWINDOW_H
