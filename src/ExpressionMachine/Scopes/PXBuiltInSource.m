//
//  PXBuiltInSource.m
//  pixate-expression-machine
//
//  Created by Kevin Lindsey on 3/11/14.
//  Copyright (c) 2014 Pixate, Inc. All rights reserved.
//

#import "PXBuiltInSource.h"

@implementation PXBuiltInSource

+ (NSString *)emaSource
{
    return @"//\n"
        "// empty for now, which means we're able to implement all of this in em, yay!\n"
        "//\n";
}

+ (NSString *)emSource
{
    return @"//\n"
        "// Numerical Constants\n"
        "//\n"
        "sym E                = 2.71828182845904523536028747135266250;   // e\n"
        "sym LOG2E            = 1.44269504088896340735992468100189214;   // log2(e)\n"
        "sym LOG10E           = 0.434294481903251827651128918916605082;  // log10(e)\n"
        "sym LN2              = 0.693147180559945309417232121458176568;  // loge(2)\n"
        "sym LN10             = 2.30258509299404568401799145468436421;   // loge(10)\n"
        "sym PI               = 3.14159265358979323846264338327950288;   // pi\n"
        "sym π                = 3.14159265358979323846264338327950288;   // pi\n"
        "sym PI_OVER_TWO      = 1.57079632679489661923132169163975144;   // pi/2\n"
        "sym PI_OVER_FOUR     = 0.785398163397448309615660845819875721;  // pi/4\n"
        "sym ONE_OVER_PI      = 0.318309886183790671537767526745028724;  // 1/pi\n"
        "sym TWO_OVER_PI      = 0.636619772367581343075535053490057448;  // 2/pi\n"
        "sym TWO_OVER_SQRT_PI = 1.12837916709551257389615890312154517;   // 2/sqrt(pi)\n"
        "sym SQRT2            = 1.41421356237309504880168872420969808;   // sqrt(2)\n"
        "sym ONE_OVER_SQRT2   = 0.707106781186547524400844362104849039;  // 1/sqrt(2)\n"
        "\n"
        "//\n"
        "// The min function returns the smaller of two values\n"
        "//\n"
        "func min(a, b) {\n"
        "  (a < b) ? a : b;\n"
        "}\n"
        "\n"
        "//\n"
        "// The max function returns the larger of two values\n"
        "//\n"
        "func max(a, b) {\n"
        "  (a > b) ? a : b;\n"
        "}\n"
        "\n"
        "//\n"
        "// The abs function returns the negation of negative numbers and\n"
        "// returns positive numbers untouched\n"
        "//\n"
        "func abs(a) {\n"
        "  (a < 0) ? -a : a;\n"
        "}\n"
        "\n"
        "//\n"
        "// The clamp function is used to guarantee that a value lies within a\n"
        "// well-defined range. If the number is below the range, then the 'low'\n"
        "// value will be returned. If the number is above the range, then the\n"
        "// 'high' value will be returned. Otherwise, the number will be returned\n"
        "// untouched\n"
        "//\n"
        "func clamp(value, low = 0, high = 1) {\n"
        "  min(high, max(low, value));\n"
        "}\n"
        "\n"
        "\n"
        "//\n"
        "// The normalize function is used to map a value to a percentage within\n"
        "// a range. The result is typically a value between 0 and 1; however, it\n"
        "// is possible to provide a value outside of the range, resulting in\n"
        "// negative values and values over 1\n"
        "//\n"
        "func normalize(value, low, high, clampResult=false) {\n"
        "  sym result = (value - low) / (high - low);\n"
        "\n"
        "  clampResult ? clamp(result) : result;\n"
        "}\n"
        "\n"
        "//\n"
        "// The distance function is used to find the distance between two points\n"
        "//\n"
        "func distance(x1, y1, x2, y2) {\n"
        "  sym dx = x2 - x1;\n"
        "  sym dy = y2 - y1;\n"
        "\n"
        "  √(dx*dx + dy*dy);\n"
        "}\n"
        "\n"
        "//\n"
        "// Linearly interpolate a value between start and end using t as a\n"
        "// percentage. If t is zero, this returns start. If t is one, this\n"
        "// returns end. For all values in between zero and one, a percentage\n"
        "// between start and end is returned.\n"
        "//\n"
        "// Note that t may be outside the close interval [0,1]; however, it\n"
        "// usually expected to be clamped to that interval\n"
        "//\n"
        "func lerp(start, end, t) {\n"
        "  start + (end - start) * t;\n"
        "}\n"
        "\n"
        "//\n"
        "// Map a value from one range to a value in another range. This finds\n"
        "// the percentage the value is between start1 and end1. This percentage\n"
        "// is then applied to start2 and end2 to find the mapped value.\n"
        "//\n"
        "func map(value, start1, end1, start2, end2, clampResult=false) {\n"
        "  lerp(\n"
        "    start2,\n"
        "    end2,\n"
        "    normalize(value, start1, end1, clampResult)\n"
        "  );\n"
        "}\n"
        "\n"
        "//\n"
        "// Geometry Functions\n"
        "//\n"
        "\n"
        "func point(x, y) {\n"
        "  {\n"
        "    type: 'point',\n"
        "    x: x,\n"
        "    y: y\n"
        "  };\n"
        "}\n"
        "\n"
        "func size(width, height) {\n"
        "  {\n"
        "    type: 'size',\n"
        "    width: width,\n"
        "    height: height\n"
        "  };\n"
        "}\n"
        "\n"
        "//\n"
        "// The rect function returns an object representing the bounds of a rectangle\n"
        "//\n"
        "func rect(x, y, width, height) {\n"
        "  {\n"
        "    type: 'rect',\n"
        "    x: x,\n"
        "    y: y,\n"
        "    width: width,\n"
        "    height: height\n"
        "  };\n"
        "}\n"
        "\n"
        "//\n"
        "// Make a shallow copy of an object. The first argument is the object\n"
        "// to copy from. If only an object is specified, then all properties\n"
        "// will be copied. Otherwise, a list of properties to copy may be\n"
        "// specified as the second and greater arguments\n"
        "//\n"
        "func snapshot() {\n"
        "    sym obj = arguments.shift();\n"
        "    sym keys = (arguments.length() == 0) ? obj.keys() : arguments;\n"
        "    sym result = {};\n"
        "\n"
        "    keys.forEach(func(key) {\n"
        "        result.push(key, obj{key});\n"
        "    });\n"
        "\n"
        "    result;\n"
        "}\n"
        "\n"
        "//\n"
        "// URLs\n"
        "//\n"
        "\n"
        "//\n"
        "// This function joins whatever values are passed to it. Values are\n"
        "// expected to be a strings.\n"
        "//\n"
        "func url() {\n"
        "  arguments.join();\n"
        "}\n";
}

@end
