#include "deleteform.h"
#include "ui_deleteform.h"

deleteForm::deleteForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::deleteForm)
{
    ui->setupUi(this);
}

deleteForm::~deleteForm()
{
    delete ui;
}
