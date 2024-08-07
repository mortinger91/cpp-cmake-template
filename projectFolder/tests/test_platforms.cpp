#include "test.h"
#include <string>

void testValidPlatform()
{
    std::string platform = "";
#ifdef LINUX
    platform = "Linux";
#endif
#ifdef MACOS
    platform = "macOS";
#endif
#ifdef WINDOWS
    platform = "Windows";
#endif
    assertTrue(platform != "");
    std::cout << "Platform detected: " << platform << std::endl;
}

int main()
{
    testValidPlatform();

    return 0;
}
