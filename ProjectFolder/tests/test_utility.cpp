#include "test.h"

#include "../src/lib/utility.h"

void testHelloWorld()
{
    assert(Utility::HelloWorld() == "Hello World!");
}

int main()
{
    testHelloWorld();

    return 0;
}
