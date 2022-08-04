#include "Student.h"
/*!
	\file
	\brief Файл реализации классa Student

	Данный файл содержит в себе реализацию класса Student
	, используемого в демонстрационной программе
*/
Student::Student(std::string full_name, std::string date_of_birth,
	std::string year_of_admission, std::string university_name) :
	Person::Person(full_name, date_of_birth), year_of_admission(year_of_admission),
	university_name(university_name) {}
 
void Student::printInfo() {
	Person::printInfo();
	std::cout << "Year of admission: " << year_of_admission << std::endl;
	std::cout << "University name: " << university_name << std::endl;
}
int Student::ageByYearOfAdmission() {
	return Person::ageOfPersonGivenDate("01.09." + year_of_admission);
}