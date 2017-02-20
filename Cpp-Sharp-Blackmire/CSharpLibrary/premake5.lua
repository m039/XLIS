-- premake5.lua

workspace "XLIS"
  configurations { "Debug", "Release" }

project "CSharpFooBarLibrary"
  kind "SharedLib"
  language "C#"
  targetdir "bin/%{cfg.buildcfg}"

  files { "**.cs" }

  filter "configurations:Debug"
    defines { "DEBUG" }
    symbols "On"

  filter "configurations:Release"
    optimize "On"
