#pragma once

#include "IBar.hpp"
#include <memory>

namespace CSharpFooBarLibrary {

  class Bar {

  private:
    std::shared_ptr<IBar> impl;

  public:
    void Register(const std::shared_ptr<IBar>& ibar);

    int PerformGetNumber();
  };

} /* CSharpFooBarLibrary*/
