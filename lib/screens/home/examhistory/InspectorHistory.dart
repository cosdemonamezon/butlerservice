import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InspectorHistory extends StatefulWidget {
  const InspectorHistory({super.key});

  @override
  State<InspectorHistory> createState() => _InspectorHistoryState();
}

class _InspectorHistoryState extends State<InspectorHistory> {
  Completer<GoogleMapController> mapcontroller = Completer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: kBackgroundColor,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          centerTitle: true,
          title: Text(
            'ประวัติการตรวจ',
            style: TextStyle(fontSize: 25, color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_w.png'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  Text(
                    'ผู้ตรวจ',
                    style: TextStyle(fontSize: 20, color: kSecondTextColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: kPointColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: size.height * 0.12,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('assets/images/rppEll.png'),
                        ),
                      ),
                      Text(
                        'ผู้ตรวจ นาย สมหมาย ขยันยิ่ง',
                        style: TextStyle(fontSize: 20, color: kSecondTextColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'วันที่',
                    style: TextStyle(fontSize: 20, color: kSecondTextColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: kPointColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Text(
                          '07/09/66',
                          style:
                              TextStyle(fontSize: 20, color: kSecondTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'เวลา',
                    style: TextStyle(fontSize: 20, color: kSecondTextColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: kPointColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Text(
                          '09.00 น',
                          style:
                              TextStyle(fontSize: 20, color: kSecondTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'รายละเอียด',
                    style: TextStyle(fontSize: 20, color: kSecondTextColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: kPointColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  height: size.height * 0.28,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ชื่อ',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                            Text(
                              'บ้านของฉัน A',
                              style: TextStyle(
                                  fontSize: 15.53, color: kSecondTextColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ชื่อเจ้าของบ้าน',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                            Text(
                              'นาย สมพร ร่ำรวย',
                              style: TextStyle(
                                  fontSize: 15.53, color: kSecondTextColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'หมายเลขสถานที่',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                            Text(
                              'BP11245644886699',
                              style: TextStyle(
                                  fontSize: 15.53, color: kSecondTextColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'สถานที่',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.12,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'รายละเอียดในการตรวจ',
                    style: TextStyle(fontSize: 20, color: kSecondTextColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: kPointColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Text(
                              'ถังขยะหน้าบ้าน',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Image.asset(
                                'assets/icons/icon-park-solid_check-one.png'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Text(
                              'ตู้ไปรษณีย์',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Image.asset(
                                'assets/icons/icon-park-solid_check-one.png'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Text(
                              'ไฟหน้าบ้าน',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Image.asset(
                                'assets/icons/icon-park-solid_check-one.png'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Text(
                              'ประตูบ้าน',
                              style: TextStyle(
                                  fontSize: 15, color: kSecondTextColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Image.asset(
                                'assets/icons/icon-park-solid_check-one.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'รูปถ่าย',
                    style: TextStyle(fontSize: 20, color: kSecondTextColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Image.asset('assets/images/r1.png'),
                  Image.asset('assets/images/r2.png'),
                  Image.asset('assets/images/r3.png'),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'รายงานปัญหา',
                style: TextStyle(fontSize: 15, color: kSecondTextColor),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
