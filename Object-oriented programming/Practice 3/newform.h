#ifndef NEWFORM_H
#define NEWFORM_H

#include <QWidget>

namespace Ui {
class NewForm;
}

class NewForm : public QWidget
{
    Q_OBJECT

public:
    explicit NewForm(QWidget *parent = nullptr);
    ~NewForm() = default;

signals:
    void path_chosen(QString);

private slots:
    void on_PathButton_clicked();

    void on_CancelButton_clicked();

    void on_CreateButton_clicked();

private:
    bool checkValidFile(QString fileName);

    Ui::NewForm *ui;
};

#endif // NEWFORM_H
