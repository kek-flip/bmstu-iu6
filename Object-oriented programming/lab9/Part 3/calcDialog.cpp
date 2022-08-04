#include <QVector>
#include <QGridLayout>
#include <QPushButton>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <cmath>
#include "calcDialog.h"

// Идентификаторы кнопок
// Для цифровых кнопок идентификатор является соответствующая цифра
#define DIV 10
#define MUL 11
#define MINUS 12
#define PLUS 13
#define INVERSE 15
#define DOT 16
#define SIN 17
#define COS 18
#define POW 19
#define LOG 20
#define EQ 21
#define BKSP 30
#define CLR 31
#define CLR_ALL 32

// количество кнопок в группе, отображаемой в виде сетки
#define GRID_KEYS 16

// Описатель кнопки
struct BtnDescr
{
    QString text;           ///< Отображаемый на кнопке текст
    int id;                 ///< Идентификатор кнопки
    BtnDescr() { id = 0; }; ///< Конструктор по умолчанию
    ///< Конструктор для инициализации
    BtnDescr(const QString &str, int i)
    {
        text = str;
        id = i;
    };
};
/// Динамический массив-вектор элементов описателей кнопок
QVector<BtnDescr> _btnDescr;
/// Инициализация массива _btnDescr всеми отображаемыми кнопками
void InitBtnDescrArray()
{
    _btnDescr.push_back(BtnDescr("7", 7));
    _btnDescr.push_back(BtnDescr("8", 8));
    _btnDescr.push_back(BtnDescr("9", 9));
    _btnDescr.push_back(BtnDescr("/", DIV));
    _btnDescr.push_back(BtnDescr("4", 4));
    _btnDescr.push_back(BtnDescr("5", 5));
    _btnDescr.push_back(BtnDescr("6", 6));
    _btnDescr.push_back(BtnDescr("*", MUL));
    _btnDescr.push_back(BtnDescr("1", 1));
    _btnDescr.push_back(BtnDescr("2", 2));
    _btnDescr.push_back(BtnDescr("3", 3));
    _btnDescr.push_back(BtnDescr("-", MINUS));
    _btnDescr.push_back(BtnDescr("0", 0));
    _btnDescr.push_back(BtnDescr("-/+", INVERSE));
    _btnDescr.push_back(BtnDescr(".", DOT));
    _btnDescr.push_back(BtnDescr("+", PLUS));
    _btnDescr.push_back(BtnDescr("<-", BKSP));
    _btnDescr.push_back(BtnDescr("CE", CLR));
    _btnDescr.push_back(BtnDescr("C", CLR_ALL)); //18

    _btnDescr.push_back(BtnDescr("sin", SIN));
    _btnDescr.push_back(BtnDescr("cos", COS));
    _btnDescr.push_back(BtnDescr("X^y", POW));
    _btnDescr.push_back(BtnDescr("Log(x)Y", LOG)); //22

    _btnDescr.push_back(BtnDescr("=", EQ)); 
}
/// Конструктор класса калькулятора
CalcDialog::CalcDialog(QWidget *parent)
{
    initNum();           // инициализируем счетные переменные
    InitBtnDescrArray(); // инициализируем массив с описанием кнопок
    // Создаем форму
    m_pLineEdit = new QLineEdit(this);
    // устанавливаем режим только чтения - разрешаем ввод только
    // с нарисованных кнопок
    m_pLineEdit->setReadOnly(true);
    m_pSignalMapper = new QSignalMapper(this);
    // создаем схемы выравнивания
    QGridLayout *gridLayout = new QGridLayout();
    QHBoxLayout *bccKeysLayout = new QHBoxLayout();
    QHBoxLayout *mainKeysLayout = new QHBoxLayout();
    QVBoxLayout *dlgLayout = new QVBoxLayout();
    QVBoxLayout *zhirina = new QVBoxLayout(); // Layout назван в честь студентки ИУ6-21Б Жиры Ключниковой (Ирины Ступниковой)
    // Заполняем форму кнопками из _btnDescr
    for (int i = 0; i < _btnDescr.size(); i++)
    {
        // Создаем кнопку с текстом из очередного описателя
        QPushButton *button = new QPushButton(_btnDescr[i].text);
        // если кнопка в основном блоке цифровых или "=" -
        // разрешаем изменение всех размеров
        if (i >= GRID_KEYS + 3 || i < GRID_KEYS)
            button->setSizePolicy(QSizePolicy::Expanding,
                                  QSizePolicy::Expanding);
        // если кнопка не цифровая - увеличиваем шрифт надписи на 4 пункта
        if (_btnDescr[i].id >= 10)
        {
            QFont fnt = button->font();
            fnt.setPointSize(fnt.pointSize() + 4);
            button->setFont(fnt);
        }
        // связываем сигнал нажатия кнопки с объектом m_pSignalMapper
        connect(button, SIGNAL(clicked()), m_pSignalMapper, SLOT(map()));
        // обеспечиваем соответствие кнопки её идентификатору
        m_pSignalMapper->setMapping(button, _btnDescr[i].id);
        if (i < GRID_KEYS) // Если кнопка из центрального блока - помещаем в сетку
            gridLayout->addWidget(button, i / 4, i % 4);
        else if (i < GRID_KEYS + 3) // кнопка из верхнего блока - в bccKeysLayout
            bccKeysLayout->addWidget(button);
        else if (i < GRID_KEYS + 7) 
            zhirina->addWidget(button);
        else
        { // кнопка "=" - помещаем в блок mainKeysLayout после gridLayout
            mainKeysLayout->addLayout(zhirina);
            mainKeysLayout->addLayout(gridLayout);
            mainKeysLayout->addWidget(button);
        }
    }
    // связываем сигнал из m_pSignalMapper о нажатии со слотом clicked
    // нашего класса
    connect(m_pSignalMapper, SIGNAL(mappedInt(int)),
            this, SLOT(clicked(int)));
    // добавляем блоки кнопок в схему выравнивания всей формы
    // dlgLayout->addWidget(zhirina);
    dlgLayout->addWidget(m_pLineEdit);
    dlgLayout->addLayout(bccKeysLayout);
    dlgLayout->addLayout(mainKeysLayout);
    // связываем схему выравнивания dlgLayout с формой
    setLayout(dlgLayout);
    // отображаем "0" в поле ввода чисел m_pLineEdit
    setNumEdit(0);
};
// Обработка нажатия клавиш
void CalcDialog::clicked(int id)
{ // по идентификатору кнопки ищем действие для выполнения
    switch (id)
    {
    case INVERSE: // унарная операция +/-
    {
        setNumEdit(getNumEdit() * -1.0);
        break;
    }
    case SIN:
    {
        setNumEdit(sin(getNumEdit()));
        break;
    }
    case COS:
    {
        setNumEdit(cos(getNumEdit()));
        break;
    }
    case DOT: // добавление десятичной точки
    {
        // если на экране результат предыдущей операции - сбросить
        checkOpPerf();
        QString str = m_pLineEdit->text();
        str.append("."); // добавляем точку к строке
        bool ok = false;
        // проверяем, является ли результат числом (исключаем 0.1. )
        str.toDouble(&ok);
        // если строка является числом - помещаем резульат в m_pLineEdit
        if (ok)
            m_pLineEdit->setText(str);
        break;
    };
    case DIV: // бинарные арифметические операции
    case MUL:
    case PLUS:
    case MINUS:
    case EQ:
    case POW:
    case LOG:
    {
        calcPrevOp(id);
        break;
    }
    case CLR_ALL:
        initNum(); // удалить всё
        break;
    case CLR:
    {
        setNumEdit(0); // записать в m_pLineEdit число 0
        break;
    }
    case BKSP:
    { // удалить последний символ
        // если на экране резульатат предыдущей операции - сбросить
        checkOpPerf();
        QString str = m_pLineEdit->text();
        if (str.length())
        {
            // если строка в m_pLineEdit не нулевая - удалить символ
            str.remove(str.length() - 1, 1);
            m_pLineEdit->setText(str);
        }
        break;
    }
    default:
    { // обработка цифровых клавиш
        // если на экране результат предыдущей операции - сбросить
        checkOpPerf();
        QString sId;
        // сформировать строку по идентификатору нажатой клавиши
        sId.setNum(id);
        QString str = m_pLineEdit->text();
        if (str == "0")
            str = sId; // затираем незначащий нуль
        else
            str.append(sId); // добавить в m_pLineEdit нажатую цифру
        m_pLineEdit->setText(str);
    }
    };
};
// Получить число из m_pLineEdit
double CalcDialog::getNumEdit()
{
    double result;
    QString str = m_pLineEdit->text();
    result = str.toDouble(); // преобразовать строку в число
    return result;
};
// записать число в m_pLineEdit
void CalcDialog::setNumEdit(double num)
{
    QString str;
    str.setNum(num, 'g', 25); // преобразовать вещественное число в строку
    m_pLineEdit->setText(str);
};
// Выполнить предыдущую бинарную операцию
void CalcDialog::calcPrevOp(int curOp)
{
    // получить число на экране
    // m_Val хранит число, введенное до нажатия кнопки операции
    double num = getNumEdit();
    switch (m_Op)
    {
    case DIV:
    {
        if (num != 0)
            m_Val /= num;
        else
            m_Val = 0;
        break;
    }
    case MUL:
    {
        m_Val *= num;
        break;
    }
    case PLUS:
    {
        m_Val += num;
        break;
    }
    case MINUS:
    {
        m_Val -= num;
        break;
    }
    case POW:
    {
        m_Val = pow(m_Val, num);
        break;
    }
    case LOG:
    {
        m_Val = log10(m_Val) / log10(num);
        break;
    }
    case EQ:
    { // если была нажата кнопка "=" - не делать ничего
        m_Val = num;
        break;
    }
    }
    m_Op = curOp;      // запомнить результат текущей операции
    setNumEdit(m_Val); // отобразить результат
    m_bPerf = true;    // поставить флаг выполнения операции
};
void CalcDialog::checkOpPerf()
{
    if (m_bPerf)
    {
        // если что-то выполнялось - очистить m_pLineEdit
        m_pLineEdit->clear();
        m_bPerf = false;
    };
};
void CalcDialog::initNum()
{
    m_bPerf = false;
    m_Val = 0;
    m_Op = EQ;
};