#pragma once

// Foo hosts a number
class Foo {

public:
  int number;

  Foo();

  ~Foo();

  int GetNumber();

  void SetNumber(int number);

};
