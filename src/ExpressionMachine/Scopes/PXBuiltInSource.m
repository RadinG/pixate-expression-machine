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
        "// Named Color Constants\n"
        "//\n"
        "sym black    = rgb(  0,   0,   0);\n"
        "sym blue     = rgb(  0,   0, 255);\n"
        "sym darkGrey = rgb(169, 169, 169);\n"
        "sym green    = rgb(  0, 128,   0);\n"
        "sym orange   = rgb(255, 165,   0);\n"
        "sym red      = rgb(255,   0,   0);\n"
        "sym white    = rgb(255, 255, 255);\n"
        "sym yellow   = rgb(255, 255,   0);\n"
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
        "// URLs\n"
        "//\n"
        "\n"
        "//\n"
        "// This function returns whatever value is passed to it. The value is\n"
        "// expected to be a string.\n"
        "//\n"
        "function url(URL) {\n"
        "  URL;\n"
        "}\n"
        "\n"
        "//\n"
        "// Easing Functions\n"
        "//\n"
        "\n"
        "// linear easing\n"
        "\n"
        "func linear(t) {\n"
        "  t;\n"
        "}\n"
        "\n"
        "// quadratic easings\n"
        "\n"
        "func quadraticIn(t) {\n"
        "  t * t;\n"
        "}\n"
        "\n"
        "func quadraticOut(t) {\n"
        "  -(t * (t - 2));\n"
        "}\n"
        "\n"
        "func quadraticInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    2 * t * t;\n"
        "  }\n"
        "  else {\n"
        "    (-2 * t * t) + (4 * t) - 1;\n"
        "  }\n"
        "}\n"
        "\n"
        "func quadraticInAndBack(t) {\n"
        "  if (t < 0.5) {\n"
        "    sym t2 = t * 2;\n"
        "\n"
        "    t2 * t2;\n"
        "  }\n"
        "  else {\n"
        "    sym t2 = (t - 0.5) * 2;\n"
        "\n"
        "    1 - t2 * t2;\n"
        "  }\n"
        "}\n"
        "\n"
        "func quadraticOutAndBack(t) {\n"
        "  if (t < 0.5) {\n"
        "    sym t2 = t * 2;\n"
        "\n"
        "    -t2 * (t2 - 2.0);\n"
        "  }\n"
        "  else {\n"
        "    sym rc = 1.0 - 0.5;\n"
        "    sym t2 = (t - 0.5) * (1.0 / rc);\n"
        "\n"
        "    1 + t2 * (t2 - 1.0 - rc);\n"
        "  }\n"
        "}\n"
        "\n"
        "// cubic easings\n"
        "\n"
        "func cubicIn(t) {\n"
        "  t * t * t;\n"
        "}\n"
        "\n"
        "func cubicOut(t) {\n"
        "  sym s = t - 1;\n"
        "\n"
        "  s * s * s + 1;\n"
        "}\n"
        "\n"
        "func cubicInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    4 * t * t * t;\n"
        "  }\n"
        "  else {\n"
        "    sym s = 2 * t - 2;\n"
        "\n"
        "    0.5 * s * s * s + 1;\n"
        "  }\n"
        "}\n"
        "\n"
        "// quartic easings\n"
        "\n"
        "func quarticIn(t) {\n"
        "  t * t * t * t;\n"
        "}\n"
        "\n"
        "func quarticOut(t) {\n"
        "  sym s = t - 1;\n"
        "\n"
        "  s * s * s * (1 - s) + 1;\n"
        "}\n"
        "\n"
        "func quarticInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    8 * t * t * t * t;\n"
        "  }\n"
        "  else {\n"
        "    sym s = t - 1;\n"
        "\n"
        "    -8 * s * s * s * s + 1;\n"
        "  }\n"
        "}\n"
        "\n"
        "// quintic easings\n"
        "\n"
        "func quinticIn(t) {\n"
        "  t * t * t * t * t;\n"
        "}\n"
        "\n"
        "func quinticOut(t) {\n"
        "  sym s = t - 1;\n"
        "\n"
        "  s * s * s * s * s + 1;\n"
        "}\n"
        "\n"
        "func quinticInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    16 * t * t * t * t * t;\n"
        "  }\n"
        "  else {\n"
        "    sym s = (2 * t) - 2;\n"
        "\n"
        "    0.5 * s * s * s * s * s + 1;\n"
        "  }\n"
        "}\n"
        "\n"
        "// sine easings\n"
        "\n"
        "func sineIn(t) {\n"
        "  sin((t - 1) * PI_OVER_TWO) + 1;\n"
        "}\n"
        "\n"
        "func sineOut(t) {\n"
        "  sin(t * PI_OVER_TWO);\n"
        "}\n"
        "\n"
        "func sineInOut(t) {\n"
        "  0.5 * (1 - cos(t * π));\n"
        "}\n"
        "\n"
        "// exponential easings\n"
        "\n"
        "func exponentialIn(t) {\n"
        "  if (t == 0) {\n"
        "    0.0;\n"
        "  }\n"
        "  else {\n"
        "    pow(2, 10 * (t - 1));\n"
        "  }\n"
        "}\n"
        "\n"
        "func exponentialOut(t) {\n"
        "  if (t == 0) {\n"
        "    0.0;\n"
        "  }\n"
        "  else {\n"
        "    pow(2, 10 * (t - 1));\n"
        "  }\n"
        "}\n"
        "\n"
        "func exponentialInOut(t) {\n"
        "  if (t == 0.0 || t == 1.0) {\n"
        "    t;\n"
        "  }\n"
        "  elsif (t < 0.5) {\n"
        "    0.5 * pow(2, (20 * t) - 10);\n"
        "  }\n"
        "  else {\n"
        "    -0.5 * pow(2, (-20 * t) + 10) + 1;\n"
        "  }\n"
        "}\n"
        "\n"
        "// circular easings\n"
        "\n"
        "func circularIn(t) {\n"
        "  1 - √(1 - (t * t));\n"
        "}\n"
        "\n"
        "func circularOut(t) {\n"
        "  √((2 - t) * t);\n"
        "}\n"
        "\n"
        "func circularInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    0.5 * (1 - √(1 - 4 * (t * t)));\n"
        "  }\n"
        "  else {\n"
        "    0.5 * ( √(-((2 * t) - 3) * ((2 * t) - 1)) + 1 );\n"
        "  }\n"
        "}\n"
        "\n"
        "// elastic easings\n"
        "\n"
        "func elasticIn(t) {\n"
        "  sin(13 * PI_OVER_TWO * t) * pow(2, 10 * (t - 1));\n"
        "}\n"
        "\n"
        "func elasticOut(t) {\n"
        "  sin(-13 * PI_OVER_TWO * (t + 1)) * pow(2, -10 * t) + 1;\n"
        "}\n"
        "\n"
        "func elasticInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    0.5 * sin(13 * PI_OVER_TWO * (2 * t)) * pow(2, 10 * ((2 * t) - 1));\n"
        "  }\n"
        "  else {\n"
        "    0.5 * (sin(-13 * PI_OVER_TWO * ((2 * t - 1) + 1)) * pow(2, -10 * (2 * t - 1)) + 2);\n"
        "  }\n"
        "}\n"
        "\n"
        "// back easings\n"
        "\n"
        "func backIn(t) {\n"
        "  t * t * t - t * sin(t * π);\n"
        "}\n"
        "\n"
        "func backOut(t) {\n"
        "  sym s = 1 - t;\n"
        "\n"
        "  1 - (s * s * s - s * sin(s * π));\n"
        "}\n"
        "\n"
        "func backInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    sym s = 2 * t;\n"
        "\n"
        "    0.5 * (s * s * s - s * sin(s * π));\n"
        "  }\n"
        "  else {\n"
        "    sym s = (1 - (2 * t - 1));\n"
        "\n"
        "    0.5 * (1 - (s * s * s - s * sin(s * π))) + 0.5;\n"
        "  }\n"
        "}\n"
        "\n"
        "// bounce easings\n"
        "\n"
        "func bounceIn(t) {\n"
        "  1 - bounceOut(1 - t);\n"
        "}\n"
        "\n"
        "func bounceOut(t) {\n"
        "  if (t < 4 / 11) {\n"
        "    (121 * t * t) / 16;\n"
        "  }\n"
        "  elsif (t < 8 / 11) {\n"
        "    (363 / 40 * t * t) - (99 / 10 * t) + 17 / 5;\n"
        "  }\n"
        "  elsif (t < 9 / 10) {\n"
        "    (4356 / 361 * t * t) - (35442 / 1805 * t) + 16061 / 1805;\n"
        "  }\n"
        "  else {\n"
        "    (54 / 5 * t * t) - (513 / 25 * t) + 268 / 25;\n"
        "  }\n"
        "}\n"
        "\n"
        "func bounceInOut(t) {\n"
        "  if (t < 0.5) {\n"
        "    bounceIn(t * 2) * 0.5;\n"
        "  }\n"
        "  else {\n"
        "    bounceOut(t * 2 - 1) * 0.5 + 0.5;\n"
        "  }\n"
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
        "// Color Functions\n"
        "//\n"
        "\n"
        "//\n"
        "// Create an 'rgba' object using the specified values. The red, green, and blue\n"
        "// values are expected to be integers in the closed interval [0,255]. The alpha\n"
        "// channel is set to 1.0.\n"
        "//\n"
        "func rgb(red, green, blue) {\n"
        "  {\n"
        "    type: 'rgba',\n"
        "    red: red,\n"
        "    green: green,\n"
        "    blue: blue,\n"
        "    alpha: 1.0\n"
        "  };\n"
        "}\n"
        "\n"
        "//\n"
        "// Create an 'rgba' object using the specified values. The red, green, and blue\n"
        "// values are expected to be integers in the closed interval [0,255]. The alpha\n"
        "// value is expected to be a double in the closed interval [0,1].\n"
        "func rgba(red, green, blue, alpha) {\n"
        "  {\n"
        "    type: 'rgba',\n"
        "    red: red,\n"
        "    green: green,\n"
        "    blue: blue,\n"
        "    alpha: alpha\n"
        "  };\n"
        "}\n"
        "\n"
        "//\n"
        "// Create an 'hsla' object using the specified values. The hue value is expected to\n"
        "// be an angle in degrees. Saturation, and lightness values are expected to be\n"
        "// doubles in the closed interval [0,1]. The alpha channel is set to 1.0.\n"
        "//\n"
        "func hsl(hue, saturation, lightness) {\n"
        "  {\n"
        "    type: 'hsla',\n"
        "    hue: hue,\n"
        "    saturation: saturation,\n"
        "    lightness: lightness,\n"
        "    alpha: 1.0\n"
        "  };\n"
        "}\n"
        "\n"
        "//\n"
        "// Create an 'hsla' object using the specified values. The hue value is expected to\n"
        "// be an angle in degrees. Saturation, lightness, and alpha values are expected to\n"
        "// be doubles in the closed interval [0,1]\n"
        "//\n"
        "func hsla(hue, saturation, lightness, alpha) {\n"
        "  {\n"
        "    type: 'hsla',\n"
        "    hue: hue,\n"
        "    saturation: saturation,\n"
        "    lightness: lightness,\n"
        "    alpha: alpha\n"
        "  };\n"
        "}\n"
        "\n"
        "//\n"
        "// Create an 'hsba' object using the specified values. The hue value is expected to\n"
        "// be an angle in degrees. Saturation, and brightness values are expected to be\n"
        "// doubles in the closed interval [0,1]. The alpha channel is set to 1.0.\n"
        "//\n"
        "func hsb(hue, saturation, brightness) {\n"
        "  {\n"
        "    type: 'hsba',\n"
        "    hue: hue,\n"
        "    saturation: saturation,\n"
        "    brightness: brightness,\n"
        "    alpha: 1.0\n"
        "  };\n"
        "}\n"
        "\n"
        "//\n"
        "// Create an 'hsba' object using the specified values. The hue value is expected to\n"
        "// be an angle in degrees. Saturation, brightness, and alpha values are expected to\n"
        "// be doubles in the closed interval [0,1]\n"
        "//\n"
        "func hsba(hue, saturation, brightness, alpha) {\n"
        "  {\n"
        "    type: 'hsba',\n"
        "    hue: hue,\n"
        "    saturation: saturation,\n"
        "    brightness: brightness,\n"
        "    alpha: alpha\n"
        "  };\n"
        "}\n";
}

@end
