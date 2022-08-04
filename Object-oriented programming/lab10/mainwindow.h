#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFile>
#include <QList>
#include <QGraphicsScene>

#include "figures.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_drawButton_clicked();

    void on_open_triggered();

private:
    Ui::MainWindow *ui;

    QPen *pen;
    QGraphicsScene *scene;

    QFile *file;
    QList<figure*> *figures;
};
#endif // MAINWINDOW_H
