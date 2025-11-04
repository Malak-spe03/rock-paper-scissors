import 'package:flutter/material.dart';

class Deco {
  static AppBar appBar(String title) {
    return AppBar(title: Text(title), centerTitle: true);
  }

  static Text scoreText(String text, {double size = 20, bool bold = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  static Padding paddedColumn({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }
}
