# C++ & C# Blackmire

The C++ files were generated and rewrited manually, cause current state of [Blackmire](https://github.com/ActiveMesa/Blackmire) is far from being fully functional. 

* `CSharpLibrary` - a core library.
* `CppConsoleProject` is an example how to use the core library (same as `CSharp-Cpp-Interop/CppConsoleProject` but with shared_ptr).
* `CppConsoleProject/unmodified` contains originally generated files by Blackmire.

## Blackmire's bugs or missed features
- An interface is generated without virtual destructor.
- Conditional statements (if/else) are not processed.
- Missed includes: memory, cstdint.
- Invisible spaces.
- Bug with a namespace in headers: incorrectly included in header.
- No guards in headers.
- Bug with `this` keywoard: no `this` keywoard in cpp files.
- Bug with a sign: `-1` converted to `1`.
- Can't process if one header depends on another.
- Doesn't throw an error if C# code uses C++ keywoards like `register`.
- Can't change default header suffix: h -> hpp.
- Headers are included as `<Foo.h>`, not as `"Foo.h"`.
- No `using namespace CSharpFooLibrary;` in cpp files.
