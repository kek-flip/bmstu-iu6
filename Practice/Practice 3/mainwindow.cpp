#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QFileDialog>
#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent): QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);

    // Настройка главной таблицы
    ui->table->setColumnCount(4);
    ui->table->setRowCount(7300);
    ui->table->setHorizontalHeaderLabels(QStringList() << "Номер" << "Категория" << "Кол-во мест" << "Цена");
    ui->table->verticalHeader()->hide();
    ui->table->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->table->setEditTriggers(QAbstractItemView::NoEditTriggers);

    // Настройка таблицы поиска
    ui->tableFind->setColumnCount(2);
    ui->tableFind->setRowCount(5000);
    ui->tableFind->setHorizontalHeaderLabels(QStringList() << "Номер" << "Цена");
    ui->tableFind->verticalHeader()->hide();
    ui->tableFind->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableFind->setEditTriggers(QAbstractItemView::NoEditTriggers);

    currentRoomsNum = 0;
    isChanged = false;
    database = nullptr;
    ui->addButton->setEnabled(false);
    ui->deleteButton->setEnabled(false);
}

MainWindow::~MainWindow() {
    database->close();
    delete ui;
}

void MainWindow::clearTable() {
    QTableWidgetItem* itm;
    for(int i = 0; i < currentRoomsNum; i++) {
        itm = new QTableWidgetItem("");
        ui->table->setItem(i, 0, itm);
        delete itm;

        itm = new QTableWidgetItem("");
        ui->table->setItem(i, 1, itm);
        delete itm;

        itm = new QTableWidgetItem("");
        ui->table->setItem(i, 2, itm);
        delete itm;

        itm = new QTableWidgetItem("");
        ui->table->setItem(i, 3, itm);
        delete itm;
    }
}


void MainWindow::clearTableFind() {
    QTableWidgetItem* itm;
    for(int i = 0; i < ui->tableFind->rowCount(); i++) {
        itm = new QTableWidgetItem("");
        ui->tableFind->setItem(i, 0, itm);
        delete itm;

        itm = new QTableWidgetItem("");
        ui->tableFind->setItem(i, 1, itm);
        delete itm;
    }
}

void MainWindow::clearAll() {
    clearTable();
    clearTableFind();
    currentCategories.clear();
    ui->categoryListAvgPrice->clear();
    ui->categoryListFind->clear();
    currentRoomsNum = 0;
    isChanged = false;
}


void MainWindow::uploadTableFromFile() {
    int i = 0;

    while(!database->atEnd()) {
        QString input = database->readLine();
        input.remove("\r\n");
        QStringList values = input.split(" ");

        QTableWidgetItem* itm;
        for(int j = 0; j < 4; j++) {
            itm = new QTableWidgetItem(values[j]);
            ui->table->setItem(i, j, itm);
        }

        if (!currentCategories.contains(values[1])) {
            currentCategories.append(values[1]);
        }

        i++;
    }

    currentRoomsNum = i;

    ui->categoryListFind->addItems(currentCategories);
    ui->categoryListAvgPrice->addItems(currentCategories);
}

void MainWindow::saveTableInFile() {
    if (isChanged) {
        database->remove();
        database->open(QFile::WriteOnly);
        for (int i = 0; i < currentRoomsNum; i++) {
            database->write((ui->table->item(i, 0)->text() + " " +
                        ui->table->item(i, 1)->text() + " " +
                        ui->table->item(i, 2)->text() + " " +
                        ui->table->item(i, 2)->text() + " " + "\r\n").toStdString().c_str());

        }
    }
}


void MainWindow::on_open_triggered() {
    QFileDialog *openDialog = new QFileDialog(this);
    openDialog->setDirectory("C:\\Users\\normp\\Documents\\Programming\\2 sem\\Practice 3"); // C:\\Users\\normp\\Documents
    openDialog->setFileMode(QFileDialog::ExistingFiles);
    openDialog->setViewMode(QFileDialog::Detail);

    database = new QFile(QFileDialog::getOpenFileName(openDialog));
    database->open(QIODevice::WriteOnly);

    clearAll();
    uploadTableFromFile();
    ui->addButton->setEnabled(true);
    ui->deleteButton->setEnabled(true);
}


void MainWindow::on_findButton_clicked() {
    int j = 0;
    QTableWidgetItem* itm;
    for(int i = 0; i < currentRoomsNum; i++) {
        if (ui->table->item(i, 1)->text() == ui->categoryListFind->currentText() &&
            ui->table->item(i, 2)->text() == ui->EditBedCount->text())
        {
            itm = new QTableWidgetItem(ui->table->item(i, 0)->text());
            ui->tableFind->setItem(j, 0, itm);

            itm = new QTableWidgetItem(ui->table->item(i, 3)->text());
            ui->tableFind->setItem(j, 1, itm);

            j++;
        }
    }

    if (j == 0) {
        itm = new QTableWidgetItem("(Нет результатов)");
        ui->tableFind->setItem(j, 0, itm);

        itm = new QTableWidgetItem("(Нет результатов)");
        ui->tableFind->setItem(j, 1, itm);
    }
}


void MainWindow::on_ButtonAvgPrice_clicked() {
    int beds = 0;
    int sum = 0;
    for(int i = 0; i < currentRoomsNum; i++) {
        if (ui->table->item(i, 1)->text() == ui->categoryListAvgPrice->currentText()) {
            beds += ui->table->item(i, 2)->text().toInt();
            sum += ui->table->item(i, 3)->text().toInt();
        }
    }
    if (sum != 0) {
        ui->EditAvgPrice->setText(QString::number(sum / beds));
    }
}


void MainWindow::on_ButtonMax_clicked() {
    int sum = 0;
    for(int i = 0; i < currentRoomsNum; i++) {
        sum += ui->table->item(i, 2)->text().toInt();
    }
    ui->EditMax->setText(QString::number(sum));
}


void MainWindow::on_new_2_triggered() {
    newWin = new NewForm();
    setEnabled(false);
    newWin->show();
    connect(newWin, SIGNAL(path_chosen(QString)), this, SLOT(on_path_chosen(QString)));
}

void MainWindow::on_path_chosen(QString path) {
    if (database == nullptr && !path.isEmpty() && !isChanged) {
        database = new QFile(path);
        database->open(QIODevice::WriteOnly);

        ui->addButton->setEnabled(true);
        ui->deleteButton->setEnabled(true);
    }
    else if (!path.isEmpty() && isChanged) {
        QMessageBox::StandardButton reply = QMessageBox::question(this, "Сохранение", "Сохранить изменения в базе?",
                                                                  QMessageBox::Yes | QMessageBox::No | QMessageBox::Cancel);
        switch(reply) {
            case QMessageBox::Yes : {
                saveTableInFile();
                database->close();
                clearAll();
                delete database;

                database = new QFile(path);
                database->open(QIODevice::WriteOnly);

                ui->addButton->setEnabled(true);
                ui->deleteButton->setEnabled(true);

                break;
            }
            case QMessageBox::No : {
                clearAll();
                database->close();
                delete database;

                database = new QFile(path);
                database->open(QIODevice::WriteOnly);

                ui->addButton->setEnabled(true);
                ui->deleteButton->setEnabled(true);

                break;
            }
            case QMessageBox::Cancel : {
                break;
            }
        }
    }

    newWin->close();
    setEnabled(true);
    delete newWin;
}


void MainWindow::on_addButton_clicked() {
    isChanged = true;
    add = new addForm();
    add->show();
    connect(add, SIGNAL(new_room(QStringList)), this, SLOT(on_new_room(QStringList)));
}

void MainWindow::on_new_room(QStringList room) {
    bool duplicateFlag = false;

    for(int i = 0; i < currentRoomsNum && !room.isEmpty(); i++){
        if(ui->table->item(i, 0)->text() == room.at(0)){
            QMessageBox::critical(add, "Ошибка", "Данная комната уже существует", QMessageBox::Ok);
            duplicateFlag = true;
        }
    }

    if (!room.isEmpty() && !duplicateFlag){
        QTableWidgetItem* itm;
        for(int j = 0; j < 4; j++) {
            itm = new QTableWidgetItem(room[j]);
            ui->table->setItem(currentRoomsNum, j, itm);
        }

        if (!currentCategories.contains(room[1])) {
            currentCategories.append(room[1]);
        }

        ui->categoryListFind->clear();
        ui->categoryListFind->addItems(currentCategories);

        ui->categoryListAvgPrice->clear();
        ui->categoryListAvgPrice->addItems(currentCategories);

        currentRoomsNum++;
    } else if(!duplicateFlag) {
        add->close();
        delete add;
    }
}

void MainWindow::on_save_triggered() {
    saveTableInFile();
    isChanged = false;
}


void MainWindow::on_barGraph_clicked() {
    if (currentRoomsNum != 0){
        barGraf = new barForm();
        QMap<QString, int> roomsPerCategory = {};
        for (int i = 0; i < currentRoomsNum; i++) {
            roomsPerCategory[ui->table->item(i, 1)->text()]++;
        }
        barGraf->show();
        barGraf->setData(roomsPerCategory);
    }
}


void MainWindow::on_deleteButton_clicked() {
    if (!ui->table->selectedItems().empty()) {
        QTableWidgetItem *itm;
        for(int i = ui->table->currentRow(); i < currentRoomsNum - 1; i++) {
            for (int j = 0; j < 4; j++) {
                itm = new QTableWidgetItem(ui->table->item(i + 1, j)->text());
                ui->table->setItem(i, j, itm);
            }
        }
        for (int j = 0; j < 4; j++) {
            itm = new QTableWidgetItem("");
            ui->table->setItem(currentRoomsNum - 1, j, itm);
        }
    }
    currentRoomsNum--;
}

