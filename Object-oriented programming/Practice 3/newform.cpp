#include "newform.h"
#include "ui_newform.h"

#include <QFileDialog>

NewForm::NewForm(QWidget *parent) : QWidget(parent), ui(new Ui::NewForm) {
    ui->setupUi(this);
}

void NewForm::on_PathButton_clicked() {
    QFileDialog *dirDialog = new QFileDialog(this);
    dirDialog->setDirectory("C:\\Users\\normp\\Documents\\Programming\\2 sem\\Practice 3"); // C:\\Users\\normp\\Documents
    dirDialog->setFileMode(QFileDialog::Directory);
    dirDialog->setOption(QFileDialog::ShowDirsOnly);

    ui->PathEdit->setText(QFileDialog::getExistingDirectory(dirDialog));
}


void NewForm::on_CancelButton_clicked() {
    QString emptyPath;
    emit path_chosen(emptyPath);
}


bool NewForm::checkValidFile(QString fileName) {
    QFile a(fileName);
    QFileInfo b(fileName);
    if(b.exists()) {
        return false;
    }
    a.open(QFile::WriteOnly);
    if (!a.isOpen()) {
        return false;
    } else {
        a.remove();
        return true;
    }
}

void NewForm::on_CreateButton_clicked() {
    QString fullFileName = ui->PathEdit->text() + "/" + ui->NameEdit->text() + ".txt";
    if (!checkValidFile(fullFileName)) {
        fullFileName.clear();
    }
    emit path_chosen(fullFileName);
}

