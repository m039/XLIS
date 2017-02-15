#pragma once

class IBar {

public:

  IBar(); // Note: explicit constructor is needed for CppSharp

  virtual int GetNumber() = 0;

  virtual ~IBar();

};
