import 'dart:async';
import 'dart:io';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class RecordSuccess extends StatefulWidget {
  RecordSuccess({super.key, this.regisuserdata, this.image});
  Map<String, dynamic>? regisuserdata = {};
  List<XFile>? image;

  @override
  State<RecordSuccess> createState() => _RecordSuccessState();
}

class _RecordSuccessState extends State<RecordSuccess> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set();

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

  void _sendMessageToLine() async {
    final url = 'line://msg/text/ข้อความที่ต้องการส่ง';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'ไม่สามารถเปิด URL: $url';
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
              ))),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                  child: Image.asset('assets/icons/circle_success_check.png')),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('หมายเลขสถานที่',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                            Text(widget.regisuserdata!['locationNumber'],
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
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
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height * 0.16,
                          width: double.infinity,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ชื่อ-สกุล',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                            Text(widget.regisuserdata!['name'],
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('รหัสสมาชิก',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                            Text(widget.regisuserdata!['memberId'],
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('วันที่',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                            Text(widget.regisuserdata!['date'],
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('เวลา',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                            Text(widget.regisuserdata!['time'],
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('รูปถ่าย',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            widget.image!.isNotEmpty
                                ? Flexible(
                                    child: Column(
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                              widget.image!.length,
                                              (index) => Padding(
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
                                                              File(widget
                                                                  .image![index]
                                                                  .path),
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('รายละเอียดเพิ่มเติม',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                            Text('สถานการณ์ปกติ',
                                style: TextStyle(
                                    fontSize: 15, color: kTextShowColor)),
                          ],
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
                  _sendMessageToLine();
                },
                child: Card(
                  color: kBtnMiniColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(
                    //   color: Colors.grey,
                    // ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    width: size.width * 0.90,
                    height: size.height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01),
                          child: Image.asset('assets/icons/line_white.png'),
                        ),
                        Text(
                          'เเชร์ไปยัง Line Group',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 16.39,
                              fontWeight: FontWeight.bold),
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
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
