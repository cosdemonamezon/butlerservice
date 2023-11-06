import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/utils/api_exception.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future<bool> messageException(BuildContext context, ApiException e) async =>
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ข้อผิดพลาด', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          content: Text(e.message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('ตกลง', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ) ??
      false;

  static Future<bool> logout(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('ออกจากระบบ'),
            content: const Text('คุณต้องการที่จะออกจากระบบ ?'),
            actions: [
              TextButton(
                child: const Text('ยกเลิก', style: TextStyle(color: kRed)),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: const Text('ตกลง', style: TextStyle(color: Colors.blue)),
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
          title: const Text('แจ้งเตือน'),
          content: const Text('คุณต้องการที่จะออกจากแอพ ?'),
          actions: [
            TextButton(
              child: const Text('ยกเลิก', style: TextStyle(color: kRed)),
              onPressed: () {
                Navigator.of(context).pop();
                status = false;
              },
            ),
            TextButton(
              child: const Text('ตกลง', style: TextStyle(color: Colors.blue)),
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
