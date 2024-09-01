import 'package:butlerservice/constants.dart';
import 'package:flutter/material.dart';

class ButtonOnClick extends StatelessWidget {
  const ButtonOnClick({super.key, required this.size, required this.press, required this.buttonName});

  final Size size;
  final VoidCallback press;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: kBackgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   color: Colors.grey,
          // ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: size.width * 0.85,
          height: size.height * 0.07,
          child: Center(
              child: Text(
            buttonName,
            style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

//////ปุ่มกดอันที่สอง
class ButtonMiniOnClick extends StatelessWidget {
  const ButtonMiniOnClick({super.key, required this.size, required this.press, required this.buttonName, required this.backgroundColor});

  final Size size;
  final VoidCallback press;
  final String buttonName;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: backgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   color: Colors.grey,
          // ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: size.width * 0.30,
          height: size.height * 0.05,
          child: Center(
              child: Text(
            buttonName,
            style: TextStyle(color: kConkgroundColor, fontSize: 16.39, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

///ปุ่มอันที่สาม
class ButtonBigOnClick extends StatelessWidget {
  const ButtonBigOnClick({super.key, required this.size, required this.press, required this.buttonName, required this.backgroundColor});

  final Size size;
  final VoidCallback press;
  final String buttonName;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: backgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   color: Colors.grey,
          // ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: size.width * 0.90,
          height: size.height * 0.06,
          child: Center(
              child: Text(
            buttonName,
            style: TextStyle(color: kConkgroundColor, fontSize: 16.39, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
