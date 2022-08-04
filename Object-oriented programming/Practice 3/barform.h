#ifndef BARFORM_H
#define BARFORM_H

#include <QWidget>
#include <QMap>

namespace Ui {
class barForm;
}

class barForm : public QWidget
{
    Q_OBJECT

public:
    explicit barForm(QWidget *parent = nullptr);
    ~barForm() = default;
    void paintEvent(QPaintEvent *event) override;
    void setData(QMap<QString, int> inputRoomsPerCategory);

private:
    Ui::barForm *ui;
    QMap<QString, int> roomsPerCategory;
};


#endif // BARFORM_H
