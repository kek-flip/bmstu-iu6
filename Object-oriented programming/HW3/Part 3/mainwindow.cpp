#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent) , ui(new Ui::MainWindow) {
    ui->setupUi(this);
    ui->tableWidget->setRowCount(10);
    ui->tableWidget->setColumnCount(10);
    for (int i = 0; i < ui->tableWidget->columnCount(); ++i) {
        ui->tableWidget->setColumnWidth(i, 78);
    }
    for (int j = 0; j < ui->tableWidget->rowCount(); ++j) {
        ui->tableWidget->setRowHeight(j, 40);
    }

    updateTable(multTable, Qt::black, 1);
}

MainWindow::~MainWindow()
{
    delete ui;
}

std::array<int, 3> MainWindow::parser(QString expression) {
    std::array<int, 3> numbers;
    numbers[0] = expression.split("*")[0].toInt();
    numbers[1] = expression.split("*")[1].split("=")[0].toInt();
    numbers[2] = expression.split("*")[1].split("=")[1].toInt();
    return numbers;
}

void MainWindow::caseHandler(std::array<int, 3> numbers, bool (*f)(int), QTextEdit *edit) {
    const auto first = numbers[0];
    const auto second = numbers[1];
    const auto third = numbers[2];

    if (f(first)) {
        edit->setTextColor(color);
    } else {
        edit->setTextColor(Qt::black);
    }
    edit->insertPlainText(QString::number(first));

    edit->setTextColor(Qt::black);
    edit->insertPlainText("*");

    if (f(second)) {
        edit->setTextColor(color);
    } else {
        edit->setTextColor(Qt::black);
    }
    edit->insertPlainText(QString::number(second));

    edit->setTextColor(Qt::black);
    edit->insertPlainText("=");

    if (f(third)) {
        edit->setTextColor(color);
    } else {
        edit->setTextColor(Qt::black);
    }
    edit->insertPlainText(QString::number(third));
}




void MainWindow::updateTable(MultTable multTable, QColor color, int index) {
    for (int i = 0; i < ui->tableWidget->rowCount(); ++i) {
        for (int j = 0; j < ui->tableWidget->columnCount(); ++j) {
             QTextEdit *edit = new QTextEdit();
             //parse text
            const auto numbers = parser(multTable.list[i * 10 + j]);
            switch(index) {
                case 1:
                if (isSimple(numbers[0])) {
                    edit->setTextColor(color);
                } else {
                    edit->setTextColor(Qt::black);
                }
                edit->insertPlainText(QString::number(numbers[0]));

                edit->setTextColor(Qt::black);
                edit->insertPlainText("*");

                if (isSimple(numbers[1])) {
                    edit->setTextColor(color);
                } else {
                    edit->setTextColor(Qt::black);
                }
                edit->insertPlainText(QString::number(numbers[1]));

                edit->setTextColor(Qt::black);
                edit->insertPlainText("=");

                if (isSimple(numbers[2])) {
                    edit->setTextColor(color);
                } else {
                    edit->setTextColor(Qt::black);
                }
                edit->insertPlainText(QString::number(numbers[2]));
                 break;
             case 2:
                 if (numbers[0] % 2 == 0) {
                     edit->setTextColor(color);
                 } else {
                     edit->setTextColor(Qt::black);
                 }
                 edit->insertPlainText(QString::number(numbers[0]));

                 edit->setTextColor(Qt::black);
                 edit->insertPlainText("*");

                 if (numbers[1] % 2 == 0) {
                     edit->setTextColor(color);
                 } else {
                     edit->setTextColor(Qt::black);
                 }
                 edit->insertPlainText(QString::number(numbers[1]));

                 edit->setTextColor(Qt::black);
                 edit->insertPlainText("=");

                 if (numbers[2] % 2 == 0) {
                     edit->setTextColor(color);
                 } else {
                     edit->setTextColor(Qt::black);
                 }
                 edit->insertPlainText(QString::number(numbers[2]));
                 break;
             case 3:
                 if (numbers[0] % 2 == 1) {
                     edit->setTextColor(color);
                 } else {
                     edit->setTextColor(Qt::black);
                 }
                 edit->insertPlainText(QString::number(numbers[0]));

                 edit->setTextColor(Qt::black);
                 edit->insertPlainText("*");

                 if (numbers[1] % 2 == 1) {
                     edit->setTextColor(color);
                 } else {
                     edit->setTextColor(Qt::black);
                 }
                 edit->insertPlainText(QString::number(numbers[1]));

                 edit->setTextColor(Qt::black);
                 edit->insertPlainText("=");

                 if (numbers[2] % 2 == 1) {
                     edit->setTextColor(color);
                 } else {
                     edit->setTextColor(Qt::black);
                 }
                 edit->insertPlainText(QString::number(numbers[2]));
                 break;
             }

             ui->tableWidget->setCellWidget(i, j, edit);
             edit->setReadOnly(true);
             edit->setAlignment(Qt::AlignCenter);
        }
    }

}

bool MainWindow::isSimple(int number) {
    if (number < 2) {
        return false;
    }
    for (int i = 2; i <= sqrt(number); ++i) {
        if (number % i == 0) {
            return false;
        }
    }
    return true;
}

void MainWindow::on_pushButton_clicked()
{
    color = QColorDialog::getColor(Qt::white, this, "Выберите цвет");
}


void MainWindow::on_pushButton_2_clicked()
{
    QCoreApplication::quit();
}


void MainWindow::on_saveButton_clicked()
{
    MultTable multTable;
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            QTextEdit *myCB = qobject_cast<QTextEdit*>(ui->tableWidget->cellWidget(i,j));
            multTable.list.push_back(myCB->toPlainText());
        }
    }

    multTable.save();
}


void MainWindow::on_saveButton_2_clicked()
{
    MultTable multTable;
    updateTable(multTable, color, 1);
}


void MainWindow::on_saveButton_3_clicked()
{
    MultTable multTable;
    updateTable(multTable, color, 2);
}


void MainWindow::on_saveButton_4_clicked()
{
    MultTable multTable;
    updateTable(multTable, color, 3);
}

