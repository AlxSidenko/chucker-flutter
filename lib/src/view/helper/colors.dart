import 'package:flutter/material.dart';

///main color used for `chucker_flutter`
const primaryColor = const Color(0xFF0D0F0F);
const background = Colors.white;
const border = const Color(0xFF3A75C2);

///secondary color used in UI
const darkCell = const Color(0xFFFAFAFA);

const textMain = const Color(0xFF333333);

///Render background color with respect to api status code
Color statusColor(int statusCode) {
  if (statusCode > 199 && statusCode < 300) {
    return Color.fromARGB(255, 133, 214, 135);
  } else if (statusCode > 399 && statusCode < 500) {
    return const Color.fromARGB(255, 243, 156, 150);
  } else if (statusCode > 499 && statusCode < 600) {
    return const Color.fromARGB(255, 212, 106, 231);
  }
  return const Color.fromARGB(255, 247, 213, 162);
}

///Render background color with respect to api method
Color methodColor(String method) {
  final lMethod = method.toLowerCase();
  if (lMethod.contains('get')) {
    return Colors.brown[400]!;
  } else if (lMethod.contains('put')) {
    return Colors.blue[400]!;
  } else if (lMethod.contains('post')) {
    return Colors.teal[300]!;
  } else if (lMethod.contains('patch')) {
    return Color.fromARGB(255, 67, 57, 57);
  } else if (lMethod.contains('delete')) {
    return Colors.red;
  }
  return Color.fromARGB(255, 247, 193, 121);
}
