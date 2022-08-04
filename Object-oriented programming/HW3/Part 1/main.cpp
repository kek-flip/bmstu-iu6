/*!
	\file
	\brief Тестирующая программа всех классов
	\example main.cpp

	Данный файл содержит в себе тестирующую программу класса Person,
	Student и StudentUnion, которая тестирует все их методы
*/

#include "person.h"
#include "student.h"
#include "studentunion.h"

int main() {
	Person person("Olegov Oleg Olegovich", "07.01.2003");
	person.printInfo();
	std::cout << person.ageOfPersonGivenDate("24.01.2022") << std::endl;
	std::cout << std::endl;
	
	Student me("Davydov Maxim Sergeevich", "13.05.2003", "2021", "MSTU");
	me.printInfo();
	std::cout << "Age of stundent by year of admission:" << me.ageByYearOfAdmission() << std::endl << std::endl;


	Student he("Sergeev Sergey Sergeevich", "21.04.2002", "2021", "SPBGUP");
	Student she("Zaytseva Alina Egorovna", "15.05.2003", "2021", "NSTU");

	StudentUnion student_club;
	student_club.addStudnet(me);
	student_club.addStudnet(he);
	student_club.addStudnet(she);
	student_club.printInfo();
	std::cout << "Number of minor student on the momemnt of university admission: " << student_club.numberOfMinor() << std::endl;

	return 0;
}