## Задание

### Первая часть

Дана последовательность строк. Каждая строка состоит из слов, разделенных пробелами. Написать программу, обеспечивающую ввод строк и их корректировку. Корректировка заключается в выравнивании строк по ширине, размер которой указан с клавиатуры. Выравнивание выполняется по возможности равномерным добавлением пробелов между словами, но не в начале и в конце строки. Вывести на печать исходную и скорректированную последовательности строк. Реализовать как с использованием библиотечных функций работы со строками, так и с помощью собственной их реализации. Оценить время выполнения программы разными реализациями.

### Вторая часть

Дан текстовый файл F с размером не менее 100 МБ. Определить все различные слова этого файла и количество их повторений. Разработать программу, которая формирует файл, содержащий список слов в порядке убывания числа повторений. Использовать файл, содержа-щий значения хэш-функции CRC16 слов исходного файла. Реализовать сортировку с помощью файлов без загрузки всего объема данных в оперативную память.

### Третья часть

Описать объект, включающий заданные поля и методы. Написать программу, которая создает массив объектов и список объектов и содержит процедуры, работающие с указанными структурами, а также создает двоичное дерево, ключом в котором является сумма чисел в выражении, а значением – позиция объекта-выражения в массиве.

Объект – выражение, состоящее из целых чисел и знаков операций (скобок нет).  
Параметры: строка, содержащая выражение.  
Методы: конструктор и процедура, определяющая количество операций.

Ввести несколько выражений и определить суммарное количе-ство операций в них. Реализовать поиск выражений по сумме чисел с использованием дерева. Программа не должна содержать ограничение длины массива. Проверить, что все созданные объекты удаляются.