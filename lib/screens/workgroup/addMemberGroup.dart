import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMemberGroup extends StatefulWidget {
  const AddMemberGroup({super.key});

  @override
  State<AddMemberGroup> createState() => _AddMemberGroupState();
}

class _AddMemberGroupState extends State<AddMemberGroup> {
  final GlobalKey<FormState> addMemberFormKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController birth = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController detailLocation = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController dayoff = TextEditingController();
  Completer<GoogleMapController> mapcontroller = Completer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: Text(
            'ตั้งค่ากลุ่มงาน',
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
                  Container(
                      width: size.width * 0.20,
                      height: size.height * 0.20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.fitHeight, image: AssetImage("assets/images/man1.png")))),
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
                        'วัน/เดือน/ปีเกิด',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: birth,
                    hintText: '12/12/2544',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกวันเดือปีเกิด';
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
                        'อายุ',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: age,
                    hintText: '22',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกอายุ';
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
                        'รายละเอียดสถานที่',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: detailLocation,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกรายละเอียดสถานที่';
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
                        'เวลาปฏิบัติงาน',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: time,
                    hintText: '06.00 - 18.00 น.',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกเวลาปฏิบัติงาน';
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
                        'วันหยุด',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: dayoff,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกวันหยุด';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonMiniOnClick(
                        size: size,
                        press: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                        },
                        buttonName: 'ทำงานปกติ',
                        backgroundColor: kBtnMiniColor,
                      ),
                      ButtonMiniOnClick(
                        size: size,
                        press: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                        },
                        buttonName: 'ลบออกจากทีม',
                        backgroundColor: kBackgroundColor,
                      ),
                    ],
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
