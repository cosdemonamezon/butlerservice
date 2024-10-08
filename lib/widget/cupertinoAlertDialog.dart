import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlert extends StatelessWidget {
  CupertinoAlert({
    Key? key,
    this.title,
    this.content,
    required this.press,
    required this.pressCancle,
  }) : super(key: key);

  final String? title;
  final String? content;

  final VoidCallback press;
  final VoidCallback pressCancle;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title ?? '',
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        content ?? '',
        style: TextStyle(fontSize: 18),
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: pressCancle,
          child: Text(
            'ยกเลิก',
            // style: TextStyle(
            //   color: kThemeTextColor,
            //   fontFamily: fontFamily,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: press,
          child: Text(
            'ตกลง',
            // style: TextStyle(
            //   color: kThemeTextColor,
            //   fontFamily: fontFamily,
            // ),
          ),
        )
      ],
    );
  }
}

class CupertinoQuestion extends StatelessWidget {
  CupertinoQuestion({Key? key, this.title, this.content, required this.press}) : super(key: key);
  String? title;
  String? content;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title!,
        style: TextStyle(fontSize: 18.53),
      ),
      content: Text(
        content!,
        style: TextStyle(fontSize: 18.53),
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: press,
          child: Text(
            'ตกลง',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.53,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}

class CupertinoshowAlert extends StatelessWidget {
  CupertinoshowAlert({
    Key? key,
    this.title,
    this.content,
    required this.press,
    required this.pressCancle,
  }) : super(key: key);

  final String? title;
  final String? content;

  final VoidCallback press;
  final VoidCallback pressCancle;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title ?? '',
        //style: TextStyle(fontFamily: fontFamily),
      ),
      content: Text(
        content ?? '',
        //style: TextStyle(fontFamily: fontFamily),
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: pressCancle,
          child: Text(
            'ยกเลิก',
            // style: TextStyle(
            //   color: kThemeTextColor,
            //   fontFamily: fontFamily,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: press,
          child: Text(
            'รับสิทธิพิเศษ',
            // style: TextStyle(
            //   color: kThemeTextColor,
            //   fontFamily: fontFamily,
            // ),
          ),
        )
      ],
    );
  }
}
