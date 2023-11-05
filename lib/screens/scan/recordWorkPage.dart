import 'dart:async';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/scan/recordSuccess.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RecordWorkPage extends StatefulWidget {
  const RecordWorkPage({super.key});

  @override
  State<RecordWorkPage> createState() => _RecordWorkPageState();
}

class _RecordWorkPageState extends State<RecordWorkPage> {
  final GlobalKey<FormState> recordFormKey = GlobalKey<FormState>();
  final TextEditingController locationNumber = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController memberId = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController remark = TextEditingController();
  late GoogleMapController mapController;
  Set<Marker> markers = Set();

  ImagePicker picker = ImagePicker();
  List<XFile> image = [];

  Completer<GoogleMapController> mapcontroller = Completer();

  Future<void> openDialogImage(int imageSelect) async {
    final result = await showModalActionSheet<String>(
      context: context,
      title: 'เลือกรูปภาพ',
      cancelLabel: 'ยกเลิก',
      actions: [
        SheetAction<String>(label: 'ถ่ายรูป', key: 'camera'),
        // SheetAction<String>(label: 'เลือกจากอัลบั้ม', key: 'gallery'),
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

      // if (result == 'gallery') {
      //   final img = await picker.pickImage(source: ImageSource.gallery);
      //   setState(() {
      //     if (imageSelect == 1 && img != null) {
      //       image.add(img);
      //     }
      //   });
      // }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      // เพิ่มปักหมุดที่ตำแหน่งที่กำหนด
      markers.add(
        Marker(
          markerId: MarkerId('SomeId'),
          position: LatLng(13.7650836, 100.5379664),
          infoWindow:
              InfoWindow(title: 'ชื่อสถานที่', snippet: 'รายละเอียดเพิ่มเติม'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: Text(
            'บันทึกรายละเอียดงาน',
            style: TextStyle(fontSize: 20, color: kConkgroundColor),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/chevron_w.png',
              scale: 1.3,
            ),
          )),
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
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
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
                        'หมายเลขสถานที่',
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: locationNumber,
                    hintText: 'BP11245644886699',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกหมายเลขสถานที่';
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
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.16,
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
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
                          markers: markers,
                          onMapCreated: _onMapCreated,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อ - สกุล',
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: name,
                    hintText: 'นาย สมชาย ขยันแจ้ง',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกชื่อ - สกุล';
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
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: memberId,
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
                        'วันที่',
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: date,
                    hintText: '15/05/66',
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
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: time,
                    hintText: '09.41',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกเวลา';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'รายละเอียดในการตรวจ',
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kConkgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                          reportCheck.length,
                          (index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01,
                                    horizontal: size.width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      reportCheck[index]['text'],
                                      style: TextStyle(
                                          color: kTextColor, fontSize: 16),
                                    ),
                                    Image.asset(
                                        'assets/icons/icon-park-solid_check-one.png'),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'รูปถ่าย',
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
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
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: SizedBox(
                                                    width: size.width * 0.20,
                                                    height: size.height * 0.12,
                                                    child: AspectRatio(
                                                      aspectRatio: 1,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image(
                                                          image: FileImage(
                                                            File(image[index]
                                                                .path),
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 10,
                                                    left: 60,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          image.removeAt(index);
                                                        });
                                                      },
                                                      child: Icon(Icons.cancel,
                                                          color:
                                                              kBackgroundColor),
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
                          height: size.height * 0.12,
                          width: size.width * 0.20,
                          decoration: BoxDecoration(
                            //color: kBackgroundColor,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Image.asset('assets/icons/Rectangle 7 (1).png'),
                              Center(
                                  child: Image.asset('assets/icons/add_w.png')),
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
                        'สถานการณ์',
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonMiniOnClick(
                        size: size,
                        press: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                        },
                        buttonName: 'ปกติ',
                        backgroundColor: kBtnMiniColor,
                      ),
                      ButtonMiniOnClick(
                        size: size,
                        press: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                        },
                        buttonName: 'ไม่ปกติ',
                        backgroundColor: kBackgroundColor,
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
                        'บันทึกรายละเอียดเพิ่มเติม',
                        style: TextStyle(
                            color: kConkgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: remark,
                    hintText: 'กรุณากรอกรายละเอียด',
                    maxline: 5,
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
          ),
          Positioned(
            bottom: size.height * 0.01,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Center(
                child: ButtonBigOnClick(
                  size: size,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordSuccess()));
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
