//
//  HelloCpp.m
//  Dealit
//
//  Created by Mohammed Ismayil on 24/07/22.
//

#import "HelloCpp.hpp"
#include <iostream>
@implementation HelloCpp


- (void) sayHelloToThisDamnWorld {
    using namespace std;
    std::cout << "Hello to this damn chaotic world" << std::endl;
}
- (void) checkEveryThingisFine{
    std::cout<<"Something is fishy"<<std::endl;
}
@end
