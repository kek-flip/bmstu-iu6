#include "person.h"
/*!
	\file
	\brief Файл реализации классa Person

	Данный файл содержит в себе реализацию класса Person
	, используемого в демонстрационной программе
*/
void Person::parseDate(int parse_date[3], std::string date) {
	std::string year = date.substr(6);
	std::string month = date.substr(3, 2);
	std::string day = date.substr(0, 2);
	parse_date[0] = stoi(year);
	parse_date[1] = stoi(month);
	parse_date[2] = stoi(day);
}

Person::Person(std::string full_name, std::string date_of_birth) :
	full_name(full_name), date_of_birth(date_of_birth) {};

void Person::printInfo() {
	std::cout << "Full name: " << full_name << std::endl;
	std::cout << "Date of birthdy: " << date_of_birth << std::endl;
}

int Person::ageOfPersonGivenDate(std::string date) {
	if (date.length() != 10 || date_of_birth.length() != 10) {
		std::cout << "Error input or date of birth" << std::endl;
		return -1;
	}
	int my_date[3];
	int other_date[3];
	parseDate(my_date, date_of_birth);
	parseDate(other_date, date);
	int answer = other_date[0] - my_date[0];

	if (other_date[1] < my_date[2] && other_date[2] < my_date[2]) {
		--answer;
	}
	if (answer < 0) {
		std::cout << "Error, date of bitrh > given date" << std::endl;
		return -1;
	}
	return answer;
}
