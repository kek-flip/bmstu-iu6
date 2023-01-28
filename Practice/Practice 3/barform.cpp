#include "barform.h"
#include "ui_barform.h"

#include <QPainter>
#include <QPair>
#include <cmath>

#define Y_OFFSET 5

barForm::barForm(QWidget *parent) : QWidget(parent), ui(new Ui::barForm) {
    ui->setupUi(this);
}

void barForm::paintEvent(QPaintEvent *event) {

    Q_UNUSED(event);

    QPainter *painter = new QPainter(this);

    int max = -1;

    foreach(int i, roomsPerCategory.values()) {
        if (i > max) {
            max = i;
        }
    }

    int h = round(ui->widget->width() / (2 * roomsPerCategory.size()));
    double m = (ui->widget->height()) / max;
    int y1 = ui->widget->height() + Y_OFFSET;
    int x = h;

    ui->labelMax->setText(QString::number(max) + "-");
    ui->labelMid->setText(QString::number(round(max / 2)) + "-");
    ui->labelZero->setText("0-");

    painter->setBrush(QBrush(Qt::green, Qt::SolidPattern));

    foreach(QString i, roomsPerCategory.keys()) {
        int y2 = y1 - round(roomsPerCategory[i] * m) + Y_OFFSET;
        QRect barRect(x, y2 + Y_OFFSET, h, y1 - y2);
        painter->drawRect(barRect);

        QRect textRect(x + round(h / 2) - 5, y2 + Y_OFFSET, 10, y1 - y2);
        for (int j = 0; j < i.length(); j++) {
            QString offset;
            for (int c = 0; c < j; c++) {
                offset += "\n";
            }
            painter->drawText(textRect, Qt::AlignTop, offset + i[j]);
        }

        x += 2 * h;
    }

    delete painter;
}

void barForm::setData(QMap<QString, int> inputRoomsPerCategory) {
    roomsPerCategory = inputRoomsPerCategory;
}

