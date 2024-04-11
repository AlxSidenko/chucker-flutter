import 'package:flutter/material.dart';

///main color used for `chucker_flutter`
const primaryColor = Color.fromARGB(255, 125, 125, 125);

///secondary color used in UI
const secondaryColor = Color.fromARGB(255, 110, 108, 108);

///Render background color with respect to api status code
Color statusColor(int statusCode) {
  if (statusCode > 199 && statusCode < 300) {
    return Color.fromARGB(255, 179, 236, 181);
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
