#include "test.h"

#include "utility/utility.h"

void testHelloWorld()
{
    assert(Utility::HelloWorld() == "Hello World!");
}

int main()
{
    testHelloWorld();

    return 0;
}
