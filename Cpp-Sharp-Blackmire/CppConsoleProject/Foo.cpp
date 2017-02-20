#include "Foo.hpp"

using namespace CSharpFooBarLibrary;

int Foo::GetNumber()
{
  return number;
}

void Foo::SetNumber(int32_t number)
{
  this->number = number;
}

