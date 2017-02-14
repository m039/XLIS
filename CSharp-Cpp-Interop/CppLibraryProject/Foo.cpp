#include "Foo.hpp"

Foo::Foo() {
  this->number = 111;
}

Foo::~Foo() {
}

int Foo::GetNumber() {
  return this->number;
}

void Foo::SetNumber(int number) {
  this->number = number;
}
