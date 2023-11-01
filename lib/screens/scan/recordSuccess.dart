import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecordSuccess extends StatefulWidget {
  const RecordSuccess({super.key});

  @override
  State<RecordSuccess> createState() => _RecordSuccessState();
}

class _RecordSuccessState extends State<RecordSuccess> {
  Completer<GoogleMapController> mapcontroller = Completer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: Text(
            'บันทึกรายระเอียดงาน',
            style: TextStyle(fontSize: 25, color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_w.png'))),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Center(child: Image.asset('assets/icons/circle_success_check.png')),
              Center(
                child: Text(
                  'บันทึกเวลางานสำเร็จ',
                  style: TextStyle(fontSize: 25, color: kConkgroundColor),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [Text('รายละเอียด', style: TextStyle(fontSize: 15, color: kConkgroundColor))],
              ),
              Container(
                height: size.height * 0.55,
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01, vertical: size.height * 0.01),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('หมายเลขสถานที่', style: TextStyle(fontSize: 15, color: kTextShowColor)), Text('BP11245644886699', style: TextStyle(fontSize: 15, color: kTextShowColor))],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('สถานที่', style: TextStyle(fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                      Container(
                        height: size.height * 0.16,
                        width: double.infinity,
                        child: GoogleMap(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('ชื่อ-สกุล', style: TextStyle(fontSize: 15, color: kTextShowColor)), Text('นาย สมชาย ขยันแจ้ง', style: TextStyle(fontSize: 15, color: kTextShowColor))],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('รหัสสมาชิก', style: TextStyle(fontSize: 15, color: kTextShowColor)), Text('11544866445', style: TextStyle(fontSize: 15, color: kTextShowColor))],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('วันที่', style: TextStyle(fontSize: 15, color: kTextShowColor)), Text('15/05/66', style: TextStyle(fontSize: 15, color: kTextShowColor))],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('เวลา', style: TextStyle(fontSize: 15, color: kTextShowColor)), Text('09.41', style: TextStyle(fontSize: 15, color: kTextShowColor))],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รูปถ่าย', style: TextStyle(fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                      Row(
                        children: [Image.asset('assets/images/r1.png'), Image.asset('assets/images/r2.png'), Image.asset('assets/images/r3.png')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รายละเอียดเพิ่มเติม', style: TextStyle(fontSize: 15, color: kTextShowColor)),
                          Text('สถานการณ์ปกติ', style: TextStyle(fontSize: 15, color: kTextShowColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                  color: kBtnMiniColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(
                    //   color: Colors.grey,
                    // ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: size.width * 0.90,
                    height: size.height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                          child: Image.asset('assets/icons/line_white.png'),
                        ),
                        Text(
                          'เเชร์ไปยัง Line Group',
                          style: TextStyle(color: kConkgroundColor, fontSize: 16.39, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                },
                child: Center(
                  child: Text(
                    'กลับไปยังหน้าเเรก',
                    style: TextStyle(fontSize: 15, color: kConkgroundColor),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
