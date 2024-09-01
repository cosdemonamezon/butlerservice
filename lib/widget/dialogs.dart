import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/utils/api_exception.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future<bool> messageException(BuildContext context, ApiException e) async =>
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('ข้อผิดพลาด', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          content: Text(e.message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('ตกลง', style: TextStyle(fontSize: 22,color: Colors.black)),
            ),
          ],
        ),
      ) ??
      false;

  static Future<bool> logout(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('ออกจากระบบ'),
            content: Text('คุณต้องการที่จะออกจากระบบ ?', style: TextStyle(fontSize: 22,)),
            actions: [
              TextButton(
                child: Text('ยกเลิก', style: TextStyle(fontSize: 22,color: kRed)),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text('ตกลง', style: TextStyle(fontSize: 22,color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        ) ??
        false;
  }

  static Future<bool> exitApp(BuildContext context) async {
    bool status = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('แจ้งเตือน'),
          content: Text('คุณต้องการที่จะออกจากแอพ ?', style: TextStyle(fontSize: 22,)),
          actions: [
            TextButton(
              child: Text('ยกเลิก', style: TextStyle(fontSize: 22,color: kRed)),
              onPressed: () {
                Navigator.of(context).pop();
                status = false;
              },
            ),
            TextButton(
              child: Text('ตกลง', style: TextStyle(fontSize: 22,color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
                status = true;
              },
            ),
          ],
        );
      },
    );
    return status;
  }
}
