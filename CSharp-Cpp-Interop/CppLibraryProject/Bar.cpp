#include <cstdlib>

#include "Bar.hpp"

Bar::Bar() {
  this->impl = NULL;
}

void Bar::Register(IBar *impl) {
  this->impl = impl;
}

int Bar::PerformGetNumber() {
  if (impl == NULL) {
    return -1;
  } else {
    return impl->GetNumber();
  }
}
