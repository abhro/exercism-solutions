#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include "armstrong_numbers.h"

bool is_armstrong_number(unsigned int candidate)
{
    if (candidate < 10)
    {
        return true;
    }
    int num = candidate;
    unsigned int exponent = log(num) / log(10) + 1;

    int digits[exponent];
    unsigned int i = 0;
    while (num > 0)
    {
        digits[i++] = num % 10;
        num /= 10;
    }

    unsigned int digitsum = 0;
    for (unsigned int i = 0; i < exponent; i++)
    {
        digitsum += pow(digits[i], exponent);
    }
    return candidate == digitsum;
}
