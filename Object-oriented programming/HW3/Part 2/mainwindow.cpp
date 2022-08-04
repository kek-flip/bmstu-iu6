#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

}

MainWindow::~MainWindow()
{
    delete ui;
}

bool MainWindow::deleteGreen(QImage& img)
{
    qint32 nHeight = img.height();
    qint32 nWidth = img.width();

    QProgressDialog progress("Удаление зелёного компонента...", "Прервать удаление", 0, nHeight * nWidth, this);
    progress.setWindowModality(Qt::WindowModal);
    progress.setWindowTitle("Окно прогресса");
    for (qint32 y = 0; y < nHeight; ++y) {
        QRgb* tempLine = reinterpret_cast<QRgb*>(img.scanLine(y));
        if (progress.wasCanceled()) { break; }
        for (qint32 x = 0; x < nWidth; ++x) {
            progress.setValue(x + y * nHeight);
            int r = qRed(*tempLine);
            int b = qBlue(*tempLine);
            int a = qAlpha(*tempLine);
             *tempLine++ = qRgba(r > 255 ? 255 : r < 0 ? 255 : r,
                                 0,
                                 b > 255 ? 255 : b < 0 ? 255 : b,
                                 a
                                 );
            }
       }
    if (progress.wasCanceled()) {
        QMessageBox::warning(this, "Ошибка", "Что-то пошло не так, скорее всего процесс был прерван");
        return false;
    }

    return true;
}


void MainWindow::on_pushButton_clicked()
{
    QString str;
    str = QFileDialog::getOpenFileName(this, "Выбрать файл", "C:\\",
                                       "All Files (*.*);; Формат JPEG (*.jpg);; Формат PNG (*.png)");
    ui->lineEdit->setReadOnly(true);
    ui->lineEdit->setAlignment(Qt::AlignLeft);
    ui->lineEdit->setText(str);
}


void MainWindow::on_pushButton_2_clicked()
{
    if (ui->lineEdit->text().isEmpty())
    {
        QMessageBox::information(this, "Ошибка", "Путь к файлу не может быть пустым");
        return;
    }
    QImage img(ui->lineEdit->text());
    QWidget* wgt = new QWidget;
    QHBoxLayout* phbx = new QHBoxLayout;
    phbx->minimumSize();
    QLabel* plbl = new QLabel;
    img = img.scaled(700,700,Qt::KeepAspectRatio);

    plbl->setFixedSize(img.size());
    wgt->setFixedSize(img.size() * 1.05);
    plbl->setPixmap(QPixmap::fromImage(img));

    phbx->addWidget(plbl);

    wgt->setLayout(phbx);
    wgt->show();
}

void MainWindow::on_pushButton_3_clicked()
{
    if (ui->lineEdit->text().isEmpty())
    {
        QMessageBox::warning(this, "Ошибка", "Не указан файл для сохранения");
        return;
    }

    QImage img(ui->lineEdit->text());

    QString fileName = QFileDialog::getSaveFileName(this, tr("Сохранить изображение без зеленого компонента"),
                                                    QString(),
                                                 tr("Изображения (*.png);; Изображения (*.jpg)"));
    if (!deleteGreen(img)) {
        return;
    }
    if (!fileName.isEmpty())
    {
      img.save(fileName);
    }
    QMessageBox::information(this, "Сообщение", "Файл успешно сохранён");
}


