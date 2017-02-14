#pragma once

#include "IBar.hpp"

// Bar hosts IBar

class Bar {

public:
  IBar *impl;

  Bar();

  void Register(IBar *impl);

  int PerformGetNumber();
};
