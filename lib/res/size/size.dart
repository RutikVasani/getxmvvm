import 'package:flutter/material.dart';

double width(width1, BuildContext context) {
  return MediaQuery.of(context).size.width * width1;
}

double height(height1, BuildContext context) {
  return MediaQuery.of(context).size.height * height1;
}
