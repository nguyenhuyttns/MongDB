import 'package:flutter/material.dart';

class CommonLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://pluspng.com/img-png/avengers-logo-png-avengers-logo-png-1376.png",
          width: 100,
        ),
        Text(
          "To-Do App",
          style: TextStyle(
            fontSize: 32, // font size tương đương với xl2 trong velocity_x
            fontStyle: FontStyle.italic, // chữ nghiêng
          ),
        ),
        Text(
          "Make A List of your task",
          style: TextStyle(
            fontWeight: FontWeight.w300, // font light
            color: Colors.white,
            fontSize: 18, // kích thước font nhỏ hơn
            letterSpacing: 1.2, // khoảng cách giữa các chữ
          ),
        ),
      ],
    );
  }
}
