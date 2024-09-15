import 'package:butlerservice/constants.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlertDialogReport extends StatefulWidget {
  const AlertDialogReport({super.key});

  @override
  State<AlertDialogReport> createState() => _AlertDialogReportState();
}

class _AlertDialogReportState extends State<AlertDialogReport> {
  bool enable = true;
  bool enable1 = false;
  final TextEditingController remark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(child: Text('เเจ้งผู้มาเยี่ยมเจ้าบ้าน')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Image.asset(
              'assets/images/bi_qr-code-scan.png',
              height: size.height * 0.33,
              width: size.width * 0.65,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'บ้านเลขที่',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 22),
                ),
                Text(
                  '556/55',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 22),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ชื่อผู้มาเยี่ยม',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                ),
                Text(
                  'นางสาว อรอุมา นามี',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ความสัมพันธ์',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                ),
                Text(
                  'เพื่อน',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'เวลา',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                ),
                Text(
                  '09.31 น.',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'วันที่',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                ),
                Text(
                  '08/09/66',
                  style: TextStyle(color: kSecondTextColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 17 : 20),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                enable == true
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            enable = true;
                            enable1 = false;
                          });
                          final ok = await showDialog(
                              context: context,
                              builder: (context) => CupertinoAlert(
                                    title: 'ดำเนินการสำเร็จ',
                                    content: 'อนุญาตให้เข้ามาในพื้นที่ได้',
                                    press: () {
                                      Navigator.pop(context, true);
                                    },
                                    pressCancle: () {
                                      Navigator.pop(context, false);
                                    },
                                  ));
                          if (ok == true) {
                            Navigator.pop(context, true);
                          }
                        },
                        child: Container(
                          height: size.height * 0.047,
                          width: size.width * 0.18,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
                          child: Center(
                              child: Text(
                            'อนุญาตให้เข้า',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    : DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        radius: Radius.circular(100),
                        borderType: BorderType.Rect,
                        dashPattern: [6, 3],
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              enable = true;
                              enable1 = false;
                            });
                            final ok = await showDialog(
                                context: context,
                                builder: (context) => CupertinoAlert(
                                      title: 'ดำเนินการสำเร็จ',
                                      content: 'อนุญาตให้เข้ามาในพื้นที่ได้',
                                      press: () {
                                        Navigator.pop(context, true);
                                      },
                                      pressCancle: () {
                                        Navigator.pop(context, false);
                                      },
                                    ));
                            if (ok == true) {
                              Navigator.pop(context, true);
                            }
                          },
                          child: Container(
                            height: size.height * 0.04,
                            width: size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                                child: Text(
                              'อนุญาตให้เข้า',
                              style: TextStyle(color: kSecondTextColor),
                            )),
                          ),
                        ),
                      ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                enable1 == true
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            enable = false;
                            enable1 = true;
                          });
                          final ok = await showDialog(
                              context: context,
                              builder: (context) => CupertinoAlert(
                                    title: 'ดำเนินการสำเร็จ',
                                    content: 'ไม่อนุญาตให้เข้ามาในพื้นที่ได้',
                                    press: () {
                                      Navigator.pop(context, true);
                                    },
                                    pressCancle: () {
                                      Navigator.pop(context, false);
                                    },
                                  ));
                          if (ok == true) {
                            Navigator.pop(context, true);
                          }
                        },
                        child: Container(
                          height: size.height * 0.047,
                          width: size.width * 0.18,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
                          child: Center(
                              child: Text(
                            'ไม่อนุญาตให้เข้า',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    : DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        radius: Radius.circular(100),
                        borderType: BorderType.Rect,
                        dashPattern: [6, 3],
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              enable = false;
                              enable1 = true;
                            });
                            final ok = await showDialog(
                                context: context,
                                builder: (context) => CupertinoAlert(
                                      title: 'ดำเนินการสำเร็จ',
                                      content: 'ไม่อนุญาตให้เข้ามาในพื้นที่ได้',
                                      press: () {
                                        Navigator.pop(context, true);
                                      },
                                      pressCancle: () {
                                        Navigator.pop(context, false);
                                      },
                                    ));
                            if (ok == true) {
                              Navigator.pop(context, true);
                            }
                          },
                          child: Container(
                            height: size.height * 0.04,
                            width: size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                                child: Text(
                              'ไม่อนุญาตให้เข้า',
                              style: TextStyle(color: kSecondTextColor),
                            )),
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            AppTextForm(
              controller: remark,
              hintText: '',
              maxline: 3,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'กรุณากรอกบันทึกรายละเอียดเพิ่มเติม';
                }
                return null;
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
