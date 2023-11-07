import 'dart:async';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ReportDetail extends StatefulWidget {
  const ReportDetail({super.key});

  @override
  State<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
  final GlobalKey<FormState> reportFormKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController cusId = TextEditingController();
  final TextEditingController securityGroup = TextEditingController();
  final TextEditingController groupId = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController remark = TextEditingController();
  Completer<GoogleMapController> mapcontroller = Completer();

  ImagePicker picker = ImagePicker();
  List<XFile> image = [];

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
          title: Text(
            'รายงานผลตรวจ',
            style: TextStyle(color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_w.png', scale: 1.3))),
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
                        'ชื่อ - สกุล สายตรวจ',
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
                        'ชื่อกลุ่มรปภ.',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: securityGroup,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกชื่อกลุ่มรปภ';
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
                        'รหัสประจำกลุ่ม',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: securityGroup,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกชื่อกลุ่มรปภ';
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
                        'สถานที่',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.16,
                    width: double.infinity,
                    child: GoogleMap(
                      onTap: (argument) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GooglemapPage(
                                      latitude: 13.7650836,
                                      longitude: 100.5379664,
                                    )));
                      },
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(13.7650836, 100.5379664),
                        zoom: 16,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        mapcontroller.complete(controller);
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'วันที่',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: date,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกวันที่';
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
                        'เวลา',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: time,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกเวลา';
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
                        'รูปถ่าย',
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
                                                    top: 15,
                                                    left: 60,
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
                          height: size.height * 0.13,
                          width: size.width * 0.20,
                          decoration: BoxDecoration(
                            //color: kBackgroundColor,
                            border: Border.all(
                              color: kConkgroundColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: DottedBorder(child: Icon(Icons.add)),
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
                        'สมาชิกในกลุ่ม',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    children: List.generate(
                        members.length,
                        (index) => ListTile(
                              leading: Image.asset(members[index]['image']),
                              title: Text(
                                members[index]['name'],
                                style: TextStyle(color: kConkgroundColor),
                              ),
                              trailing: Image.asset('assets/icons/icon-park-solid_check-one.png'),
                            )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'บันทึกรายละเอียดเพิ่มเติม',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: time,
                    hintText: '',
                    maxline: 5,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกรายละเอียดเพิ่มเติม';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonMiniOnClick(
                        size: size,
                        press: () {},
                        buttonName: 'ปกติ',
                        backgroundColor: kBtnMiniColor,
                      ),
                      ButtonMiniOnClick(
                        size: size,
                        press: () {},
                        buttonName: 'ไม่ปกติ',
                        backgroundColor: kBackgroundColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
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
