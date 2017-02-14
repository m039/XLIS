%module(directors="1") SwigFooBar
%{
#include "../CppLibraryProject/Foo.hpp"
#include "../CppLibraryProject/Bar.hpp"
#include "../CppLibraryProject/IBar.hpp"
%}

%include "attribute.i"

%feature("director") IBar;

%attribute(Foo, int, Number, GetNumber, SetNumber)

%ignore Foo::number;
%ignore Foo::GetNumber;
%ignore Foo::SetNumber;

#include "../CppLibraryProject/Foo.hpp"
#include "../CppLibraryProject/Bar.hpp"
#include "../CppLibraryProject/IBar.hpp"
