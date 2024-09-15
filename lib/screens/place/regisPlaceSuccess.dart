import 'dart:async';
import 'dart:io';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RegisPlaceSuccess extends StatefulWidget {
  RegisPlaceSuccess({super.key, this.image, this.regisuserdata});
  List<XFile>? image;
  Map<String, dynamic>? regisuserdata = {};

  @override
  State<RegisPlaceSuccess> createState() => _RegisPlaceSuccessState();
}

class _RegisPlaceSuccessState extends State<RegisPlaceSuccess> {
  Completer<GoogleMapController> mapcontroller = Completer();
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
          infoWindow: InfoWindow(title: 'ชื่อสถานที่', snippet: 'รายละเอียดเพิ่มเติม'),
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
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(child: Image.asset('assets/icons/circle_success_check.png')),
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
                children: [Text('รายละเอียด', style: TextStyle(fontSize: 20, color: kConkgroundColor))],
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.height * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ชื่อ-สกุล', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                          Text(widget.regisuserdata!['name'], style: TextStyle(fontSize: 19, color: kTextShowColor))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รหัสสมาชิก', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                          Text(widget.regisuserdata!['memberId'], style: TextStyle(fontSize: 19, color: kTextShowColor))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เลขประจำตัวผู้เสียภาษี', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                          Text(widget.regisuserdata!['userId'], style: TextStyle(fontSize: 19, color: kTextShowColor))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เบอร์โทร', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                          Text(widget.regisuserdata!['phone'], style: TextStyle(fontSize: 19, color: kTextShowColor))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('สถานที่', style: TextStyle(fontSize: 20, color: kTextShowColor)),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      SizedBox(
                        height: isPhone(context) ? size.height * 0.16 : size.height * 0.26,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รูปถ่าย', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(
                                      widget.image!.length,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          width: size.width * 0.22,
                                          height: size.height * 0.12,
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(
                                                image: FileImage(
                                                  File(widget.image![index].path),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รายการที่ต้องการตรวจ', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ถังขยะหน้าบ้าน', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                            Text('ตู้ไปรษณีย์ ', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                            Text('ไฟหน้าบ้าน', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                            Text('ประตูบ้าน', style: TextStyle(fontSize: 19, color: kTextShowColor))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รายละเอียดเพิ่มเติม', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('313 อาคาร ซี.พี.ทาวเวอร์ ชั้น 24 ถนนสีลมแขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ความถี่ในการตรวจ', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('เวลา 09.00 น. ทุกวัน', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                            Text('เวลา 18.00 น. ทุกวัน', style: TextStyle(fontSize: 19, color: kTextShowColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                },
                child: Center(
                  child: Text(
                    'กลับไปยังหน้าเเรก',
                    style: TextStyle(fontSize: 19, color: kConkgroundColor),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
