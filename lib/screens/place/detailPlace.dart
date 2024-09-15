import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/place/regisPlaceSuccess.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class DetailPlace extends StatefulWidget {
  const DetailPlace({super.key});

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
  final GlobalKey<FormState> placeFormKey = GlobalKey<FormState>();
  final TextEditingController type = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController memberId = TextEditingController();
  final TextEditingController userId = TextEditingController();
  final TextEditingController phone = TextEditingController();
  Completer<GoogleMapController> mapcontroller = Completer();
  ImagePicker picker = ImagePicker();
  List<XFile> image = [];
  late GoogleMapController mapController;
  Set<Marker> markers = Set();
  Map<String, dynamic> regisuser = {};
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

  Future<void> openDialogImage(int imageSelect) async {
    final result = await showModalActionSheet<String>(
      context: context,
      title: 'เลือกรูปภาพ',
      cancelLabel: 'ยกเลิก',
      actions: [
        SheetAction<String>(label: 'ถ่ายรูป', key: 'camera'),
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
          title: Text('ลงทะเบียนสถานที่'),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/chevron_w.png',
                color: kWhite,
                scale: 1.3,
              ))),
      body: Form(
        key: placeFormKey,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: kConkgroundColor,
            ),
            Positioned(
              bottom: size.height * 0.02,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Center(
                  child: ButtonBigOnClick(
                    size: size,
                    press: () {
                      if (placeFormKey.currentState!.validate()) {
                        setState(() {
                          regisuser = {
                            'type': type.text,
                            'name': name.text,
                            'memberId': memberId.text,
                            'userId': userId.text,
                            'phone': phone.text,
                          };
                        });
                        if (image.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisPlaceSuccess(
                                        image: image,
                                        regisuserdata: regisuser,
                                      )));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => CupertinoQuestion(
                              title: 'ผิดพลาด',
                              content: 'กรุณาถ่ายรูปภาพ',
                              press: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        }
                      }
                    },
                    buttonName: 'บันทึก',
                    backgroundColor: kBtnMiniColor,
                  ),
                ),
              ),
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
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ประเภท',
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
                      controller: type,
                      hintText: '',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'กรุณากรอกประเภท';
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
                          'ชื่อ - สกุล ',
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
                      hintText: 'กรอกชื่อ-นามสกุล',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'กรุณากรอกชื่อ - สกุล ';
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
                      hintText: 'ระบุรหัสสมาชิก',
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
                          'รหัสประจำตัว',
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
                      controller: userId,
                      hintText: 'ระบุรหัสประจำตัว',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'กรุณากรอกรหัสประจำตัว';
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
                      controller: phone,
                      hintText: 'ระบบเบอร์โทร',
                      keyboardType: TextInputType.number,
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
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: SizedBox(
                                                      width: size.width * 0.20,
                                                      height:
                                                          size.height * 0.12,
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
                                                      right: 10,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            image.removeAt(
                                                                index);
                                                          });
                                                        },
                                                        child: Icon(
                                                            Icons.cancel,
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
                            height: size.height * 0.1,
                            width: size.width * 0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/icons/Rectangle 7 (1).png'),
                                Center(
                                    child: Icon(Icons.add,
                                        color: kWhite, size: 40)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'รายการที่ต้องการตรวจ',
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.02,
                                    horizontal: size.width * 0.03),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '• ถังขยะหน้าบ้าน',
                                      style: TextStyle(color: kSecondTextColor, fontSize: 20),
                                    ),
                                    Text('• ตู้ไปรษณีย์ ',
                                        style:
                                            TextStyle(color: kSecondTextColor, fontSize: 20)),
                                    Text('• ไฟหน้าบ้าน',
                                        style:
                                            TextStyle(color: kSecondTextColor, fontSize: 20)),
                                    Text('• ประตูบ้าน',
                                        style:
                                            TextStyle(color: kSecondTextColor, fontSize: 20)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'รายละเอียดเพิ่มเติม',
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
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '11/29 ถนน ทางหลวงชนบท นนทบุรี 3087 ตำบล บางแม่นาง อำเภอบางใหญ่ นนทบุรี 11140',
                                    style: TextStyle(color: kSecondTextColor, fontSize: 20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ความถี่ในการตรวจ',
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('• เวลา 09.00 น. ทุกวัน',
                                    style: TextStyle(color: kSecondTextColor, fontSize: 20)),
                                Text('• เวลา 18.00 น. ทุกวัน',
                                    style: TextStyle(color: kSecondTextColor, fontSize: 20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      height: size.height * 0.10,
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
