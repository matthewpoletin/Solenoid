#include <iostream>
#include "stdio.h"
#include <conio.h>
#include <Windows.h>

#include "Maths/Maths.h"
#include "TestApplication.h"

class Application;
Application* g_pApp;

const float MATH_PI = 3.14f;
const float MATH_MU = 4 * MATH_PI * pow(10, -7);

// Сила, площадь сечения зазора, размер зазора, ток обмотки, 
unsigned int CountAmoutOfWinding(float F, float A, float delta, float I)
{
	float der_G_delta = MATH_MU * A / pow(delta, 2);
	float w = sqrtf(2*F/der_G_delta)/I;
	return floor(w);
}

std::string localization = "Russian";

int main()
{
	setlocale(LC_ALL, localization.c_str());

	g_pApp = new TestApplication;

	// Сила, площадь сечения зазора, размер зазора, ток обмотки, 
	float F, A, delta, I;

	std::cout << "Введите значения в СИ" << std::endl;
	std::cout << "Сила: ";
	std::cin >> F;
	std::cout << "Сечение: ";
	std::cin >> A;
	std::cout << "Зазор: ";
	std::cin >> delta;
	std::cout << "Ток обмотки: ";
	std::cin >> I;
	
	std::cout << "Количество витков: " << (F, A, delta, I);

	_getch();

	Sleep(100);

	return 0;
}