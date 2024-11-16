project (CoreName)
    kind "StaticLib"
    language "C"
    targetdir ("../binaries/" .. OutputDir .. "/" .. CoreName)
    objdir ("../binaries/intermediates/" .. OutputDir .. "/" .. CoreName)
    debugdir "../Assets/"

    files { "Source/**.c", "Source/**.h" }
    includedirs 
    { 
        "Source",
        "../Vendor/include" 
    }

    libdirs { "../Vendor/lib" }
    links 
    {
        "csfml-graphics", 
        "csfml-window", 
        "csfml-system" ,
        "csfml-audio",
        "csfml-network",
    }
    linkoptions { "-IGNORE:4006" }
    pchheader "corepch.h"
    pchsource "Source/corepch.c"

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        optimize "Off"
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"