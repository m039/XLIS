#include <cstdlib>
#include <cstdio>
#include <iostream>

#include "Bar.hpp"
#include "IBar.hpp"
#include "Foo.hpp"

using namespace std;
using namespace CSharpFooBarLibrary;

void TestFoo() {
  auto foo = std::unique_ptr<Foo>(new Foo());

  cout << "== Foo ==" << endl;
  cout << "Foo.number: " << foo->number << endl;
  cout << "Foo.GetNumber: " << foo->GetNumber() << endl;
  cout << "Foo.SetNumber(44)" << endl;

  foo->SetNumber(44);

  cout << "Foo.number: " << foo->number << endl;
  cout << "Foo.GetNumber: " << foo->GetNumber() << endl;
}

class BarImpl : public IBar {

public:

  virtual int GetNumber();

};

int BarImpl::GetNumber() {
  return 14;
}

void TestBar() {
  auto bar = std::unique_ptr<Bar>(new Bar());
  auto ibar = std::make_shared<BarImpl>();

  cout << "== Bar == " << endl;
  cout << "Bar.PerformGetNumber: " << bar->PerformGetNumber() << endl;
  cout << "Bar.Register(new BarImpl())" << endl;

  bar->Register(ibar);

  cout << "Bar.PerformGetNumber: " << bar->PerformGetNumber() << endl;
}

int main() {
  TestFoo();

  cout << endl;

  TestBar();

  return 0;
}
