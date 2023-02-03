#include "test.h"

#include "../src/lib/utility.h"

void testHelloWorld()
{
    ASSERT(Utility::HelloWorld() == "Hello World!")
}

int main()
{
    testHelloWorld();

    return 0;
}
