import 'package:flutter/material.dart';

class PrimaryColors {
  Color get black => const Color(0XFF000000);

  Color get white => const Color(0XFFFFFFFF);

  Color get green => Colors.green;
  Color get grey => const Color(0XFFCACACA);

  Color get purple => const Color(0XFF6497F9);

  Color get buttonColor => const Color(0xff5A68F6);

  Color get ProfileTextColor => const Color(0xff448AF2);

  Color get helloColor => const Color(0XFF403F5A);

  Color get redColor => const Color(0XFFFF6363);

  Color get lightGrey => Color.fromARGB(255, 244, 244, 244);

  Color get mediumGrey => Color.fromARGB(255, 187, 187, 187);

  Color get circleGrey => const Color(0xffC6C6C6);

  Color get lightblue => Color.fromARGB(255, 236, 244, 255);

  Color get blue => Colors.blue;

  LinearGradient mainGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 57, 134, 219),
      Color.fromARGB(255, 44, 187, 232).withOpacity(0.88),
    ],
  );

  LinearGradient unSelected = LinearGradient(
    colors: [Colors.grey.withOpacity(0.1), Colors.white],
  );
// LinearGradient shadow = LinearGradient(
//   colors: [
//     Colors.black.withOpacity(0.5),
//     Colors.grey.withOpacity(0.5),
//   ],
// );

// LinearGradient wordsOutline = const LinearGradient(
//   begin: Alignment.bottomCenter,
//   end: Alignment.topCenter,
//   colors: [
//     Color(0xff00C2FF),
//     Color(0x0000C2FF),
//   ],
// );
}
