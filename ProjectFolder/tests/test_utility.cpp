#include "test.h"
#include "utility/utility.h"

void testHelloWorld()
{
    assertTrue(Utility::HelloWorld() == "Hello World!");
    assertTrue(Utility::HelloWorld() != "I am Batman!");
}

int main()
{
    testHelloWorld();

    return 0;
}
