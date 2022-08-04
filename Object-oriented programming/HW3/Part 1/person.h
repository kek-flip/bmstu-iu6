#ifndef PERSON_H
#define PERSON_H

#include <iostream>
#include <string>
/*!
	\brief Родительский класс
	\authors Давыдов Максим
	\version 1.0
	\date 5 июня 2022 года

	Класс Person
*/

class Person {
protected:
	std::string full_name; 
	std::string date_of_birth;
	/*!
		Парсит дату вида XX.XX.XXXX
		\param[in] date заданная дата
		\param[out] parse_date[3] дата, приведенная к массиву из трех элементов
	*/
	void parseDate(int parse_date[3], std::string date);
public:
	/*!
		Конструктор класса - инициализирует поля класса
		\param[in] full_name ФИО человека
		\param[in] date_of_birth дата рождения
	*/
	Person(std::string full_name, std::string date_of_birth);
	/*!
		Печатает информацию об объекте класса Person
	*/
	void printInfo();
	/*!
		Находит возраст человека по заданной дате
		\param[in] date заданная дата
		\return Возраст человека на заданую дату
	*/
	int ageOfPersonGivenDate(std::string date);
};

#endif // PERSON_H