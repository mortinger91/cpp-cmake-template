#include "test.h"

#include <memory>

void testCpp17()
{
    std::unique_ptr<int> ptr;
    ptr = std::make_unique<int>(10);
    assert(*ptr == 10);
}

int main()
{
    testCpp17();

    return 0;
}
