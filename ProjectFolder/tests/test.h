#pragma once

#include <cassert>
#include <vector>
#include <string>
#include <iostream>

namespace test {
  
  void assertVectorContentIsEqual(std::vector<char> x, std::vector<char> y) {
    std::string errorStringSize = "size of the vectors: size of the first one: " + std::to_string(x.size()) + " size of the second one: " + std::to_string(y.size());
    std::cout << errorStringSize << std::endl;
    assert(x.size() == y.size() && "assertVectorContentIsEqual failed: the vectors does not have the same size!");
    for (size_t i =0; i<x.size(); i++) {
      if (x[i] != y[i]) {
        std::string errorString = "vectors' elements at index: " + std::to_string(i) + " do not match! first: " + std::to_string(x[i]) + " second: " + std::to_string(y[i]);
        std::cout << errorString << std::endl;
      }
      assert(x[i] == y[i] && "assertVectorContentIsEqual failed: vectors' elements do not match!");
    }
  }
}

#define ASSERT_THROW(condition)                                     \
{                                                                   \
  if(!(condition))                                                  \
  {                                                                 \
    throw std::runtime_error(   std::string( __FILE__ )             \
                              + std::string( ":" )                  \
                              + std::to_string( __LINE__ )          \
                              + std::string( " in " )               \
                              + std::string( __PRETTY_FUNCTION__ )  \
    );                                                              \
  }                                                                 \
}

#define ASSERT_EQUAL(x, y)                                          \
{                                                                   \
  if((x) != (y))                                                    \
  {                                                                 \
    throw std::runtime_error(   std::string( __FILE__ )             \
                              + std::string( ":" )                  \
                              + std::to_string( __LINE__ )          \
                              + std::string( " in " )               \
                              + std::string( __PRETTY_FUNCTION__ )  \
                              + std::string( ": " )                 \
                              + std::to_string( ( x ) )             \
                              + std::string( " != " )               \
                              + std::to_string( ( y ) )             \
    );                                                              \
  }                                                                 \
}
