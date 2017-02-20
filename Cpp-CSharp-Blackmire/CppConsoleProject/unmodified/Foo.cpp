CSharpFooBarLibrary#include <Foo.h>

int32_t number = 0;
int Foo::GetNumber()
{
  return number;
}

void Foo::SetNumber(int32_t number)
{
  ->number = number;
}

