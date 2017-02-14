#include "Foo.hpp"
#include "Bar.hpp"

#define CALL __cdecl

typedef int (__stdcall *ibar_get_number_callback) ();

extern "C" {
  CALL void* foo_create();

  CALL void foo_destroy(void *foo);

  CALL int foo_get_number(void *foo);

  CALL void foo_set_number(void *foo, int number);


  CALL void* bar_create();

  CALL void bar_destroy(void *bar);

  CALL void bar_register(void *bar, void *ibar);

  CALL int bar_perform_get_number(void *bar);


  CALL void* ibar_create(ibar_get_number_callback callback);

  CALL void ibar_destroy(void *ibar);
}

// foo functions

void* foo_create() {
  return new Foo();
}

void foo_destroy(void *foo) {
  delete (Foo*) foo;
}

int foo_get_number(void *foo) {
  return ((Foo*) foo)->GetNumber();
}

void foo_set_number(void *foo, int number) {
  ((Foo*) foo)->SetNumber(number);
}


// bar functions

void* bar_create() {
  return new Bar();
}

void bar_destroy(void *bar) {
  delete ((Bar*) bar);
}

void bar_register(void *bar, void *ibar) {
  ((Bar*) bar)->Register((IBar*) ibar);
}

int bar_perform_get_number(void *bar) {
  return ((Bar*) bar)->PerformGetNumber();
}

// ibar functions

class IBarImpl : public IBar {

  ibar_get_number_callback _callback;

public:

  IBarImpl(ibar_get_number_callback callback) {
    this->_callback = callback;
  }

  virtual int GetNumber() {
    return _callback();
  }

};

void* ibar_create(ibar_get_number_callback callback) {
  return new IBarImpl(callback);
}

void ibar_destroy(void *ibar) {
  delete ((IBar*) ibar);
}
