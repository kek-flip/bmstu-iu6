#include "StudentUnion.h"
/*!
	\file
	\brief Файл реализации классa StudentUnion

	Данный файл содержит в себе реализацию класса StudentUnion
	, используемого в демонстрационной программе
*/
StudentUnion::StudentUnion() {}
void StudentUnion::printInfo() {
	for (unsigned int i = 0; i < list_drivers.size(); ++i) {
		std::cout << i + 1 << ". ";
		list_drivers[i].printInfo();
		std::cout << std::endl;
	}
}

void StudentUnion::addStudnet(Student student) {
	list_drivers.push_back(student);
}

int StudentUnion::numberOfMinor() {
	for (unsigned int i = 0; i < list_drivers.size(); ++i) {
		if (list_drivers[i].ageByYearOfAdmission() < 18) {
			++number_of_minor;
		}
	}
	return number_of_minor;
}
