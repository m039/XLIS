#include <cstdlib>
#include <cstdio>
#include <iostream>

#include "Bar.hpp"
#include "IBar.hpp"
#include "Foo.hpp"

using namespace std;

void TestFoo() {
  Foo *foo = new Foo();

  cout << "== Foo ==" << endl;
  cout << "Foo.number: " << foo->number << endl;
  cout << "Foo.GetNumber: " << foo->GetNumber() << endl;
  cout << "Foo.SetNumber(44)" << endl;

  foo->SetNumber(44);

  cout << "Foo.number: " << foo->number << endl;
  cout << "Foo.GetNumber: " << foo->GetNumber() << endl;

  delete foo;
}

class BarImpl : public IBar {

public:

  virtual int GetNumber();

};

int BarImpl::GetNumber() {
  return 14;
}

void TestBar() {
  Bar *bar = new Bar();
  IBar *ibar = new BarImpl();

  cout << "== Bar == " << endl;
  cout << "Bar.PerformGetNumber: " << bar->PerformGetNumber() << endl;
  cout << "Bar.Register(new BarImpl())" << endl;

  bar->Register(ibar);

  cout << "Bar.PerformGetNumber: " << bar->PerformGetNumber() << endl;

  delete ibar;
  delete bar;
}

int main() {
  TestFoo();

  cout << endl;

  TestBar();

  return 0;
}
