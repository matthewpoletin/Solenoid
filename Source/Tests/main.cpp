#include <iostream>

#include "TestApplication.h"

class Application;
Application* g_pApp;

#include <Windows.h>

int main()
{
	g_pApp = new TestApplication;

	while (1)
	{
		std::cout << "im reade to count solenoid" << std::endl;
		Sleep(100);
	}

	return 0;
}