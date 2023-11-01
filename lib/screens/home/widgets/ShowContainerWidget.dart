import 'package:butlerservice/constants.dart';
import 'package:flutter/material.dart';

class ShowContainerWidget extends StatelessWidget {
  ShowContainerWidget({super.key, required this.size, required this.image, required this.press, required this.text});

  final Size size;
  final String image;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: kPointColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: press,
        child: Container(
          height: size.height * 0.12,
          width: size.width * 0.28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                '${image}',
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Text(
                  '${text}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.67),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
