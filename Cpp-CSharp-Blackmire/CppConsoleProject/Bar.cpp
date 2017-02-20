#include "Bar.hpp"

using namespace CSharpFooBarLibrary;

void Bar::Register(const std::shared_ptr<IBar>& ibar)
{
  this->impl = ibar;
}

int Bar::PerformGetNumber()
{
  if (this->impl == NULL) {
    return -1;
  } else {
    return impl->GetNumber();
  }
}

