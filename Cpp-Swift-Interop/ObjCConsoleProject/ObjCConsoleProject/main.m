#import <Foundation/Foundation.h>
#import <stdio.h>
#import "SwiftFooBarLibrary.h"

void testFoo() {
    @autoreleasepool {
        Foo *foo = [[Foo alloc] init];
        
        printf("== Foo ===\n");
        printf("Foo.number: %ld\n", foo.number);
        printf("Foo.GetNumber: %ld\n", foo.getNumber);
        printf("Foo.SetNumber(45011)\n");
        
        [foo setFooNumber: 45011];
        
        printf("Foo.number: %ld\n", foo.number);
        printf("Foo.GetNumber: %ld\n", foo.getNumber);
    }
}

@interface BarImpl : NSObject <IBar>

@end

@implementation BarImpl

- (long) getNumber {
    return 11211;
}

@end

void testBar() {
    @autoreleasepool {
        Bar *bar = [[Bar alloc] init];
        
        printf("=== Bar ===\n");
        printf("Bar.PerformGetNumber: %ld\n", [bar performGetNumber]);
        printf("Bar.Register(new BarImpl())\n");
        
        [bar register:[[BarImpl alloc] init]];
        
        printf("Bar.performGetNumber: %ld\n", [bar performGetNumber]);
    }
}

int main (int argc, const char * argv[]) {
    testFoo();
    printf("\n");
    testBar();
    
    return 0;
}
