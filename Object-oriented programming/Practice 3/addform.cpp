#include "addform.h"
#include "ui_addform.h"

#include <QIntValidator>
#include <QDoubleValidator>
#include <QRegularExpressionValidator>
#include <QRegularExpression>
#include <QMessageBox>

addForm::addForm(QWidget *parent) : QWidget(parent), ui(new Ui::addForm) {
    ui->setupUi(this);

    ui->numberEdit->setValidator(new QIntValidator(1, 7300, this));
    ui->categoryEdit->setValidator(new QRegularExpressionValidator(QRegularExpression("[а-яА-Яa-zA-Z]+")));
    ui->bedEdit->setValidator(new QIntValidator(1, 100, this));
    ui->priceEdit->setValidator(new QDoubleValidator(1, 99999, 10, this));
}

addForm::~addForm() {
    delete ui;
}

void addForm::on_cancelButton_clicked() {
    QStringList emptyRoom;
    emit new_room(emptyRoom);
}


void addForm::on_addButton_clicked() {
    if (ui->numberEdit->text() == "" ||
        ui->categoryEdit->text() == "" ||
        ui->bedEdit->text() == "" ||
        ui->priceEdit->text() == "")
    {
        QMessageBox::critical(this, "Ошибка", "Незаполнены поля", QMessageBox::Ok);
    }
    else {
        QStringList room;
        room.append(ui->numberEdit->text());
        room.append(ui->categoryEdit->text());
        room.append(ui->bedEdit->text());
        room.append(ui->priceEdit->text());

        ui->numberEdit->setText("");
        ui->categoryEdit->setText("");
        ui->bedEdit->setText("");
        ui->priceEdit->setText("");

        emit new_room(room);
    }
}

