#pragma once

#define ASSERT(x)                                                   \
{                                                                   \
  if (!(x)) { throw; }                                              \
}
