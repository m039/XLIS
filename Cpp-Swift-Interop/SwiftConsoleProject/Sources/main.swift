import SwiftFooBarLibrary
import Foundation

func testFoo() {
    let f = Foo()

    print("== Foo ===")
    print("Foo.number: \(f.number)")
    print("Foo.GetNumber: \(f.getNumber())")
    print("Foo.SetNumber(450)")

    f.setFooNumber(450)

    print("Foo.number: \(f.number)")
    print("Foo.GetNumber: \(f.getNumber())")
}

class BarImpl : NSObject, IBar {
    func getNumber() -> Int {
        return 1919
    }
}

func testBar() {
    let b = Bar()

    print("=== Bar ===")
    print("Bar.PerformGetNumber: \(b.performGetNumber())")
    print("Bar.Register(new BarImpl())")

    b.register(BarImpl())

    print("Bar.performGetNumber: \(b.performGetNumber())")
}

testFoo()
print()
testBar()

