import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegisPlaceSuccess extends StatefulWidget {
  const RegisPlaceSuccess({super.key});

  @override
  State<RegisPlaceSuccess> createState() => _RegisPlaceSuccessState();
}

class _RegisPlaceSuccessState extends State<RegisPlaceSuccess> {
  Completer<GoogleMapController> mapcontroller = Completer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: Text(
            'ลงทะเบียนสถานที่',
            style: TextStyle(fontSize: 20, color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/chevron_w.png',
                scale: 1.3,
              ))),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Center(
                  child: Image.asset('assets/icons/circle_success_check.png')),
              SizedBox(
                height: size.height * 0.01,
              ),
              Center(
                child: Text(
                  'ลงทะเบียนสถานที่',
                  style: TextStyle(fontSize: 25, color: kConkgroundColor),
                ),
              ),
              Center(
                child: Text(
                  'สำหรับบุคคลธรรมดาเสร็จสิ้น',
                  style: TextStyle(fontSize: 25, color: kConkgroundColor),
                ),
              ),
              Center(
                child: Text(
                  'ระบบจะใช้เวลาประมาณ 2 - 3 วัน',
                  style: TextStyle(fontSize: 20, color: kConkgroundColor),
                ),
              ),
              Center(
                child: Text(
                  'เเล้วจะเเจ้งกลับให้ท่านทราบโดยเร็ว',
                  style: TextStyle(fontSize: 20, color: kConkgroundColor),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Text('รายละเอียด',
                      style: TextStyle(fontSize: 15, color: kConkgroundColor))
                ],
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                      vertical: size.height * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ชื่อ-สกุล',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                          Text('นายสม พร ร่ำรวย',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รหัสสมาชิก',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                          Text('11544866445',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เลขประจำตัวผู้เสียภาษี',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                          Text('1105466544846',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เบอร์โทร',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                          Text('02-4456644',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('สถานที่',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.18,
                        width: double.infinity,
                        //color: kTextShowColor,
                        child: Transform.scale(
                          scale: 0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
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
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รูปถ่าย',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/home1111.png'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รายการที่ต้องการตรวจ',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ถังขยะหน้าบ้าน'),
                            Text('ตู้ไปรษณีย์ '),
                            Text('ไฟหน้าบ้าน'),
                            Text('ประตูบ้าน')
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รายละเอียดเพิ่มเติม',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '313 อาคาร ซี.พี.ทาวเวอร์ ชั้น 24 ถนนสีลมแขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ความถี่ในการตรวจ',
                              style: TextStyle(
                                  fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
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
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPage()),
                      (route) => false);
                },
                child: Center(
                  child: Text(
                    'กลับไปยังหน้าเเรก',
                    style: TextStyle(fontSize: 15, color: kConkgroundColor),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
