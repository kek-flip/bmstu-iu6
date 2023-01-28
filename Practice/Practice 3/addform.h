#ifndef ADDFORM_H
#define ADDFORM_H

#include <QWidget>

namespace Ui {
class addForm;
}

class addForm : public QWidget
{
    Q_OBJECT

public:
    explicit addForm(QWidget *parent = nullptr);
    ~addForm();

signals:
    void new_room(QStringList);

private slots:
    void on_cancelButton_clicked();

    void on_addButton_clicked();

private:
    Ui::addForm *ui;
};

#endif // ADDFORM_H
