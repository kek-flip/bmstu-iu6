#ifndef STUDENTUNION_H
#define STUDENTUNION_H

#include "student.h"
#include <vector>
/*!
	\brief Ассоциация
	\authors Давыдов Максим
	\version 1.0
	\date 5 июня 2022 года

	Данный класс имеет демонстрирует навыки работы с коспозицией классов C++
*/

class StudentUnion {
private:
	unsigned int number_of_minor = 0;
	std::vector <Student> list_drivers;
public:
	/*!
		Конструктор класса - инициализирует пустой список
	*/
	StudentUnion();
	/*!
		Выводит список участников студенческого профсоюза
	*/
	void printInfo();
	/*!
		Добавляет студента в конец списка
	\param student студент, который будет добавлен в конец списка
	*/
	void addStudnet(Student student);
	/*!
		Вычисляет количество студентов, поступивших в университет будучи несовршеннолетними
		\warning поступлением в университет считается дата - 01.09.XXXX
	*/
	int numberOfMinor();
};

#endif // STUDENTUNION_H
