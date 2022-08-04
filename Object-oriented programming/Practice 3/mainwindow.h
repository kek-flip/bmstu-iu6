#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFile>

#include "newform.h"
#include "barform.h"
#include "addform.h"

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
    void on_open_triggered();

    void on_findButton_clicked();

    void on_ButtonAvgPrice_clicked();

    void on_ButtonMax_clicked();

    void on_new_2_triggered();

    void on_addButton_clicked();

    void on_save_triggered();

    void on_barGraph_clicked();

    void on_path_chosen(QString);

    void on_new_room(QStringList);

    void on_deleteButton_clicked();

private:
    void clearTable();
    void clearTableFind();
    void clearAll();
    void uploadTableFromFile();
    void saveTableInFile();

    Ui::MainWindow *ui;
    QStringList currentCategories;
    int currentRoomsNum;
    QFile* database;

    bool isChanged;

    NewForm *newWin;
    barForm *barGraf;
    addForm *add;
};
#endif // MAINWINDOW_H
