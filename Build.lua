ProjectName = "Sandbox"
CoreName = "Core"
AppName = "App"
OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

workspace "CSFML-Project"
    configurations { "Debug", "Release", "Dist" }
    architecture "x64"
    startproject (AppName)

    filter "system:windows"
        systemversion "latest"
        defines { "WINDOWS" }
    
    group "Core"
       	include "Core/Build-Core.lua"
    group ""
        include "App/Build-App.lua"