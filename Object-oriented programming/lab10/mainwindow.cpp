#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QMessageBox>
#include <QRegularExpression>
#include <QRegularExpressionValidator>

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);

    ui->xEdit->setValidator(new QRegularExpressionValidator(QRegularExpression("[0-9]+")));
    ui->yEdit->setValidator(new QRegularExpressionValidator(QRegularExpression("[0-9]+")));
    ui->zEdit->setValidator(new QRegularExpressionValidator(QRegularExpression("[0-9]+")));

    figures = new QList<figure*>();
    file = nullptr;
    scene = nullptr;
    pen = new QPen(Qt::black);
}

MainWindow::~MainWindow() {
    delete ui;
}


void MainWindow::on_drawButton_clicked() {
    if (file == nullptr) {
        QMessageBox::critical(this, "Ошибка", "Вы не открыли файл");
    } else {
        double xAngle = ui->xEdit->text().toInt();
        double yAngle = ui->yEdit->text().toInt();
        double zAngle = ui->zEdit->text().toInt();

        scene = new QGraphicsScene();
        for(int i = 0; i < figures->size(); i++) {
            figures->at(i)->rotate(xAngle, yAngle, zAngle);
            figures->at(i)->draw(scene, pen);
        }
        ui->graphicsView->setScene(scene);
    }
}


void MainWindow::on_open_triggered() {
    file = new QFile(".\\prism.txt");
    file->open(QFile::ReadWrite);
    while(!file->atEnd()) {
        QString input = file->readLine();
        input.remove("\r\n");
        QStringList data = input.split(" ");
        if (data[0] == '1') {
            figures->append(new prism({data[1].toInt(), data[2].toInt(), 0},
                                      {data[3].toInt(), data[4].toInt(), 0},
                                      {data[5].toInt(), data[6].toInt(), 0},
                                      data[7].toInt()
                                     ));
        }
        if (data[0] == '2') {
            figures->append(new cylinder({data[1].toInt(), data[2].toInt(), 0}, data[3].toInt(), data[4].toInt()));
        }
    }
    scene = new QGraphicsScene();
    for(int i = 0; i < figures->size(); i++) {
        figures->at(i)->draw(scene, pen);
    }
    ui->graphicsView->setScene(scene);
}

