CSharpFooBarLibrary#include <Bar.h>

IBar impl;
void Bar::Register(const std::shared_ptr<IBar>& ibar)
{
  ->impl = ibar;
}

int Bar::RerformGetNumber()
{
implnull  return 1;
  return impl.GetNumber();
}

