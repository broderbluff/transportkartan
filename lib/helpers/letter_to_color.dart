import 'package:flutter/material.dart';

Color getColorBasedOnFirstCharacter(String text) {
  if (text.isEmpty || text[0].toUpperCase() != text[0]) return Colors.grey;

  List<Color> pastelColors = [
    const Color(0xFFFFB3BA), // A
    const Color(0xFFFFDFBA), // B
    const Color(0xFFFFD7BA), // C
    const Color(0xFFFFBABA), // D
    const Color(0xFFD5BAFF), // E
    const Color(0xFFBAFFC9), // F
    const Color(0xFFBAE1FF), // G
    const Color(0xFFBFFCC6), // H
    const Color(0xFFBFFFE7), // I
    const Color(0xFFC1FFBF), // J
    const Color(0xFFE7FFBF), // K
    const Color(0xFFFFFDBF), // L
    const Color(0xFFFFE1BA), // M
    const Color(0xFFFFBAE1), // N
    const Color(0xFFE1BAFF), // O
    const Color(0xFFBAE1FF), // P
    const Color(0xFFBAFFD7), // Q
    const Color(0xFFBAFFB3), // R
    const Color(0xFFD7FFBA), // S
    const Color(0xFFFFFDBA), // T
    const Color(0xFFFFD7BA), // U
    const Color(0xFFFFBAB3), // V
    const Color(0xFFD7BAFF), // W
    const Color(0xFFBAB3FF), // X
    const Color(0xFFB3BAFF), // Y
    const Color(0xFFB3FFBA), // Z
  ];

  int charCode = text.codeUnitAt(0) - 65; // A-Z to 0-25
  return pastelColors[charCode % pastelColors.length];
}
