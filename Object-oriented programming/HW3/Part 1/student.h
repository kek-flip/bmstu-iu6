#ifndef STUDENT_H
#define STUDENT_H

#include "person.h"
/*!
	\brief Дочерний класс
	\authors Давыдов Максим
	\version 1.0
	\date 5 июня 2022 года

	Данный класс имеет демонстрирует навыки наследования классов С++
*/
class Student : public Person {
protected:
	std::string year_of_admission;
	std::string university_name;
public:
	/*!
		Конструктор класса - инициализирует поля класса
		\param[in] full_name ФИО человека
		\param[in] date_of_birth дата рождения
		\param[in] year_of_admission год поступления
		\param[in] university_name название университета
	*/
	Student(std::string full_name, std::string date_of_birth,
		std::string year_of_admission, std::string university_name);
	/*!
		Печатает информацию об объекте класса Student
	*/
	void printInfo();
	/*!
		Находит возраст человека на момент поступления в университет
		\return Возраст человека на момент поступления в университет
	*/
	int ageByYearOfAdmission();
};

#endif // STUDENT_H