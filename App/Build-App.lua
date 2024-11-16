project (AppName)
    kind "ConsoleApp"
    language "C"
    targetdir ("../binaries/" .. OutputDir .. "/" .. AppName)
    objdir ("../binaries/intermediates/" .. OutputDir .. "/" .. AppName)
    debugdir "../Assets/"

    files { "Source/**.c", "Source/**.h" }
    includedirs 
    { 
        "Source", 
        "../Core/Source",
        "../Vendor/include" 
    }
    
    libdirs { "../Vendor/lib", "../binaries/" .. OutputDir .. "/" .. CoreName }
    links 
    {
        "Core",
        "csfml-graphics", 
        "csfml-window", 
        "csfml-system" ,
        "csfml-audio",
        "csfml-network",
    }
    
    postbuildcommands 
    {
		"{COPY} ../Vendor/bin/*.dll %{cfg.targetdir}",
	}

    filter "configurations:Debug"
        kind "ConsoleApp"
        defines { "DEBUG" }
        symbols "On"
        runtime "Debug"

    filter "configurations:Release"
        kind "ConsoleApp"
        defines { "RELEASE" }
        optimize "On"
        symbols "On"
        runtime "Release"

    filter "configurations:Dist"
        kind "WindowedApp"
		defines { "DIST" }
		optimize "On"
		symbols "Off"
		runtime "Release"