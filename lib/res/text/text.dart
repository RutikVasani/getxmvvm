import 'package:getxmvvm/res/size/size.dart';
import 'package:flutter/material.dart';

Text text(String text, double size, Color color, BuildContext context) {
  return Text(
    text,
    style: TextStyle(fontSize: width(size, context), color: color),
  );
}

Text boldtText(String text, double size, Color color, BuildContext context) {
  return Text(
    text,
    style: TextStyle(
        fontSize: width(size, context),
        color: color,
        fontWeight: FontWeight.bold),
  );
}
