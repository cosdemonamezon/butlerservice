import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WorkstopPage extends StatefulWidget {
  const WorkstopPage({super.key});

  @override
  State<WorkstopPage> createState() => _WorkstopPageState();
}

class _WorkstopPageState extends State<WorkstopPage> {
  ImagePicker picker = ImagePicker();
  List<XFile> image = [];
  final GlobalKey<FormState> workstopFormKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController cusId = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController group = TextEditingController();
  final TextEditingController startdate = TextEditingController();
  final TextEditingController enddate = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController remark = TextEditingController();
  final TextEditingController approve = TextEditingController();
  final TextEditingController position = TextEditingController();

  Future<void> openDialogImage(int imageSelect) async {
    final result = await showModalActionSheet<String>(
      context: context,
      title: 'เลือกรูปภาพ',
      cancelLabel: 'ยกเลิก',
      actions: [
        SheetAction<String>(label: 'ถ่ายรูป', key: 'camera'),
        SheetAction<String>(label: 'เลือกจากอัลบั้ม', key: 'gallery'),
      ],
    );
    if (result != null) {
      if (result == 'camera') {
        final img = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          if (imageSelect == 1 && img != null) {
            image.add(img);
          }
        });
      }

      if (result == 'gallery') {
        final img = await picker.pickImage(source: ImageSource.gallery);
        setState(() {
          if (imageSelect == 1 && img != null) {
            image.add(img);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Text('เเจ้งหยุดงาน'),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/icons/chevron_w.png', scale: 1.3)),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: kConkgroundColor,
          ),
          Container(
            height: size.height * 0.80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อ - สกุล',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: name,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกชื่อ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'รหัสสมาชิก',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: cusId,
                    hintText: '11544866445',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกรหัสสมาชิก';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'เบอร์โทร',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: phone,
                    hintText: '065-4455544',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกเบอร์โทร';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'กลุ่ม',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: group,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกกลุ่ม';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'วันลาหยุดที่ต้องการ',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'ตั้งเเต่วันที่',
                                style: TextStyle(color: kConkgroundColor, fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.45,
                            child: AppTextForm(
                              controller: startdate,
                              hintText: '',
                              // validator: (val) {
                              //   if (val == null || val.isEmpty) {
                              //     return 'กรุณากรอกกลุ่ม';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'ถึงวันที่',
                                style: TextStyle(color: kConkgroundColor, fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.45,
                            child: AppTextForm(
                              controller: enddate,
                              hintText: '',
                              // validator: (val) {
                              //   if (val == null || val.isEmpty) {
                              //     return 'กรุณากรอกกลุ่ม';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ลักษณะลา',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: type,
                    hintText: '',
                    // validator: (val) {
                    //   if (val == null || val.isEmpty) {
                    //     return 'กรุณากรอกกลุ่ม';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'เหตุผลในการลา',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: type,
                    hintText: '',
                    // validator: (val) {
                    //   if (val == null || val.isEmpty) {
                    //     return 'กรุณากรอกกลุ่ม';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'เอกสาร',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      image.isNotEmpty
                          ? Flexible(
                              child: Column(
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(
                                        image.length,
                                        (index) => Stack(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: SizedBox(
                                                    height: size.height * 0.15,
                                                    width: size.width * 0.20,
                                                    child: Image(
                                                      image: FileImage(File(image[index].path)),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 20,
                                                    left: 65,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          image.removeAt(index);
                                                        });
                                                      },
                                                      child: Icon(Icons.cancel, color: kBackgroundColor),
                                                    )),
                                              ],
                                            )),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      GestureDetector(
                        onTap: () => openDialogImage(1),
                        child: Container(
                          height: size.height * 0.1,
                          width: size.width * 0.20,
                          decoration: BoxDecoration(
                            //color: kBackgroundColor,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/icons/Rectangle 7 (1).png'),
                              Center(child: Icon(Icons.add, color: kWhite, size: 40)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ผู้อนุมัติ',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: approve,
                    hintText: '',
                    // validator: (val) {
                    //   if (val == null || val.isEmpty) {
                    //     return 'กรุณากรอกกลุ่ม';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ตำเเหน่ง',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: position,
                    hintText: 'หัวหน้าทีม',
                    // validator: (val) {
                    //   if (val == null || val.isEmpty) {
                    //     return 'กรุณากรอกกลุ่ม';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(
                    height: size.height * 0.10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Center(
                child: ButtonBigOnClick(
                  size: size,
                  press: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoQuestion(
                              title: 'บันทึกสำเร็จ',
                              content: 'กดตกลง เพื่อกลับไปหน้าหลัก',
                              press: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                              },
                            ));
                  },
                  buttonName: 'บันทึก',
                  backgroundColor: kBtnMiniColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
