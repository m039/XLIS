%module(directors="1") SwigFooBar
%{
#include "Foo.hpp"
#include "Bar.hpp"
#include "IBar.hpp"
%}

%include "attribute.i"

%feature("director") IBar;

%attribute(Foo, int, Number, GetNumber, SetNumber)

%ignore Foo::number;
%ignore Foo::GetNumber;
%ignore Foo::SetNumber;

#include "Foo.hpp"
#include "Bar.hpp"
#include "IBar.hpp"
