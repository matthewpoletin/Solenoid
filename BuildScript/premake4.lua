-- cd Desktop/justbear/Liman/BuildScript/
-- build-vs2015.bat
dofile("utils.lua")
------------------------------------------------------------------
os.chdir(os.getcwd() .. "/../")
working_dir = os.getcwd() .. "/"
------------------------------------------------------------------
lib_ide_path = ""
if (_ACTION == "vs2013") then
	lib_ide_path = working_dir .. "Dependencies/Library/vs2013"
elseif (_ACTION == "vs2015") then
	lib_ide_path = working_dir .. "Dependencies/Library/vs2015"
end
------------------------------------------------------------------
if (_ACTION == "clean") then
	cleaning = true else cleaning = false
end
----------------------------------------------------------------
if (cleaning) then premake_ver = 4  else premake_ver = 5 end
----------------------------------------------------------------
-- Solenoid solution
------------------------------------------------------------------
solution("Solenoid")

	if(premake_ver == 5) then
		startproject("Tests")
	end
	location(working_dir .. "Source/")
	includedirs { working_dir .. "Dependencies/Include" }

	if (ide_os == "windows") then
		platforms { "x32", "x64" }
		if (premake_ver == 5) then system "windows" end
		defines { "WINDOWS" }
	end

	configurations { "Debug", "Release" }

	configuration "Debug"
		libdirs { lib_ide_path, lib_ide_path .. "/Debug" }
		defines { "DEBUG", "_DEBUG", "_DEBUG_", "Debug" }

	configuration "Release"
		libdirs { lib_ide_path, lib_ide_path .. "/Release" }
		defines { "NDEBUG", "NDebug" }

	------------------------------------------------------------
	-- "Core" library project
	------------------------------------------------------------
	project ("Core")
		language "C++"
		kind "StaticLib"

		targetname ("Core")
		if (ide_os == "windows") then targetextension ".lib" end
		location (working_dir .. "Source/Core")

		files {
			working_dir .. "Source/Core" .. "/**.h",
			working_dir .. "Source/Core" .. "/**.cpp"
		}

		links {
			"tinyxml2"
		}

		defines { "_LIB", "_CONSOLE" }

		configuration "Debug"
			flags { "Unicode" }
			flags { "Symbols" }
			objdir (working_dir .. "Temp" .. "/Core" .. "/Debug")
			targetdir (working_dir .. "Build" .. "/Core" .. "/Debug")
			if (premake_ver == 5) then optimize "Debug" end

		configuration "Release"
			flags { "Unicode" }
			flags { "Optimize" }
			objdir (working_dir .. "Temp" .. "/Core" .. "/Release")
			targetdir (working_dir .. "Build" .. "/Core" .. "/Release")
			if (premake_ver == 5) then optimize "Full" end
	
	------------------------------------------------------------------
	-- "Tests" console project
	------------------------------------------------------------------
	project ("Tests")
		language "C++"
		kind "ConsoleApp"

		if(premake_ver == 5) then
			dependson { "Core" }
		end

		targetname ("Tests")
		if (ide_os == "windows") then targetextension ".exe" end
		location (working_dir .. "Source/Tests" .. "/")

		files {
			working_dir .. "Source/Tests" .. "/**.h",
			working_dir .. "Source/Tests" .. "/**.cpp"
		}

		includedirs { working_dir .. "Source/Core" }


		links {
			"Core.lib"
		}


		defines { "_CONSOLE" }

		configuration "Debug"
			flags { "Unicode" }
			flags { "Symbols" }
			libdirs { working_dir .. "Build/Core/Debug"}
			objdir (working_dir .. "Temp" .. "/Tests" .. "/Debug")
			targetdir (working_dir .. "Build" .. "/Tests" .. "/Debug")
			if (premake_ver == 5) then optimize "Debug" end

		configuration "Release"
			flags { "Unicode" }
			flags { "Optimize" }
			libdirs { working_dir .. "Build/Core/Release"}
			objdir (working_dir .. "Temp" .. "/Tests" .. "/Release")
			targetdir (working_dir .. "Build" .. "/Tests" .. "/Release")
			if (premake_ver == 5) then optimize "Full" end