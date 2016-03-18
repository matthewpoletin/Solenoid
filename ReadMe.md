## Solenoid
###Calculating basic solenoid parameters in C/C++.

#### Repository structure
"Solenoid/"
+ "BuildScript/" - premake scripts
+ "Source/" - souce code
  + "Core/" - main counig c/c++ static library
  + "Tests/" - console interaction
  + "Dll/" - dinamic library for c# winforms interfacing
  + "Solenoid/" - C# final program
+ "Dependencies/" - external dependecies folder
  + "Includes/"
  + "Libraries/"
+ "!Temp/" - temporary folder for binary purposes
+ "!Build/" - temporary folder with final files

"!*" - folder is not synced with git

#### Getting started
* clone repository on your machine
* run script "BuildScrip/build-vs2015.bat"
* open "Source/Solenoid.sln"

Before you merge any changes into repository, please, don't forget to use "BuildScrip/clean.bat"