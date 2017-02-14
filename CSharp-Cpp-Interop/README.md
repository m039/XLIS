# C# & C++ Interop Example

Example how one may implement C++ interface in C# and pass it back to the C++ using [P/Invoke](https://en.wikipedia.org/wiki/Platform_Invocation_Services).

* `CppLibraryProject` - a core library.
* `CLibraryProject` - a wrapper for the core library.
* `CppConsoleProject` and `CSharpConsoleProject` are examples how to use the core library.
* `Precompiled` is a folder which contains a shared library.

My motivation is to find out how hard to write business logic in C++ and leverage CLR from it.
