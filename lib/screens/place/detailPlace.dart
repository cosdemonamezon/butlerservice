import 'dart:async';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/place/regisPlaceSuccess.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
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
            'ลงทะเบียนสถานที่',
            style: TextStyle(fontSize: 25, color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_w.png'))),
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
                    hintText: '',
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
                    hintText: '4554488446554',
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
                    hintText: '1105546877944',
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
                    hintText: '02-4456644',
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
                  Container(
                    height: size.height * 0.20,
                    width: double.infinity,
                    //color: Colors.white,
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
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    height: size.height * 0.15,
                                                    width: size.width * 0.20,
                                                    child: Image(
                                                      image: FileImage(File(
                                                          image[index].path)),
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
                      GestureDetector(
                        onTap: () => openDialogImage(1),
                        child: Container(
                          height: size.height * 0.12,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/add_w.png'),
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
                                  Text('ถังขยะหน้าบ้าน'),
                                  Text('ตู้ไปรษณีย์ '),
                                  Text('ไฟหน้าบ้าน'),
                                  Text('ประตูบ้าน'),
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
                                  '11/29 ถนน ทางหลวงชนบท นนทบุรี 3087 ตำบล บางแม่นาง อำเภอบางใหญ่ นนทบุรี 11140'),
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
                              Text('เวลา 09.00 น. ทุกวัน'),
                              Text('เวลา 18.00 น. ทุกวัน'),
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
          Positioned(
            bottom: size.height * 0.02,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Center(
                child: ButtonBigOnClick(
                  size: size,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisPlaceSuccess()));
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
