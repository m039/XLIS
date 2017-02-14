# C# & C++ CppSharp Example

Same thing as `CSharp-Cpp-Interop`, but with [CppSharp](https://github.com/mono/CppSharp).

* `CppLibraryProject` is a core library.
* `CSharpProjects/CppSharpLibraryGeneratorProject` is used to generate a file with C++ and C# glue.
* `CSharpProjects/CppSharpLibraryProject` is only needed to eliminate unsafe directive.
* `CSharpProjects/CSharpConsoleProject` is an example how to use the core library.
* `Precompiled` is a folder with a shared library.
