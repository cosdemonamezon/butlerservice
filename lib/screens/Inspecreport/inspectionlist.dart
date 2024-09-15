import 'dart:async';
import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/model/location.dart';
import 'package:butlerservice/screens/scan/recordWork.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InspectionList extends StatefulWidget {
  const InspectionList({super.key});

  @override
  State<InspectionList> createState() => _InspectionListState();
}

class _InspectionListState extends State<InspectionList> {
  Completer<GoogleMapController> mapcontroller = Completer();
  Completer<GoogleMapController> mapcontroller1 = Completer();
  String barcode = "";
  Location? location;
  

  @override
  void initState() {
    super.initState();
    //scan();
  }

  Future scan() async {
    try {
      ScanResult _barcode = await BarcodeScanner.scan();
      setState(() {
        barcode = _barcode.rawContent;
      });

      if (barcode != '') {
        // final _getlocation = await LoginService.scanLocation(barcode);
        // setState(() {
        //   location = _getlocation;
        // });
        if (barcode == '12345') {
          if (!mounted) return;
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWork()));
        } else {
          showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoQuestion(
                    title: 'แจ้งเตือน',
                    content: 'QR Code ไม่ถูกต้อง',
                    press: () {
                      Navigator.pop(context, true);
                    },
                  ));
        }

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => RecordWork(
        //               listlocation: location,
        //             )));
        //inspect(location);
      } else {
        if (!mounted) return;
        //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWork()));
        showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoQuestion(
                  title: 'แจ้งเตือน',
                  content: 'QR Code ไม่ถูกต้อง',
                  press: () {
                    Navigator.pop(context, true);
                  },
                ));
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => FirstPage()),
        //     (route) => false);
      }
    } on PlatformException catch (e) {
      inspect(e);
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // The user did not grant the camera permission.
      } else {
        showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoQuestion(
                  title: 'แจ้งเตือน',
                  content: 'มีผิดพลาดกรุณาติดต่อแอดมิน',
                  press: () {
                    Navigator.pop(context, true);
                  },
                ));
        // Unknown error.
      }
    } on FormatException {
      // User returned using the "back"-button before scanning anything.
    } on Exception catch (e) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoQuestion(
                title: 'แจ้งเตือน',
                content: '$e',
                press: () {
                  Navigator.pop(context, true);
                },
              ));
      // Unknown error.
    } catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'รายการตรวจประจำวัน',
          style: TextStyle(color: kSecondTextColor, fontSize: 24),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/icons/chevron_left.png', color: kGrey, scale: 1.3)),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: kBackgroundColor,
          ),
          Container(
            height: size.height * 0.80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kConkgroundColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * 0.03,
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailExamHistory()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width * 0.38,
                          height: isPhone(context) ? size.height * 0.39 : size.height * 0.29,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Image.asset(
                                    'assets/images/mehome.png',
                                    fit: BoxFit.fill,
                                    scale: 1,
                                    height: size.height * 0.38,
                                  )),
                              Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'บ้านของฉัน',
                                              style: TextStyle(fontSize: 17.53, color: kSecondTextColor, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.02,
                                            ),
                                            GestureDetector(onTap: () {scan();}, child: Icon(Icons.qr_code_scanner, size: 40,))
                                          ],
                                        ),
                                        Text(
                                          'หมายเลขสถานที่',
                                          style: TextStyle(fontSize: 17.53, color: kSecondTextColor, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'BP11245644886699',
                                          style: TextStyle(
                                            fontSize: 17.53,
                                            color: kSecondTextColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'สถานที่',
                                              style: TextStyle(fontSize: 16.53, color: kSecondTextColor, fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                              child: Text(
                                                'ตั้งค่า',
                                                style: TextStyle(color: kBackgroundColor, fontSize: 16.53),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.12,
                                          width: double.infinity,
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
                                        Text(
                                          'รายละเอียดเพิ่มเติม',
                                          style: TextStyle(fontSize: 16.53, fontWeight: FontWeight.bold, color: kSecondTextColor),
                                        ),
                                        Text(
                                          '313 อาคาร ซี.พี.ทาวเวอร์ ชั้น 24 ถนนสีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500',
                                          style: TextStyle(fontSize: 16.53, color: kSecondTextColor),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailExamHistory()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width * 0.38,
                          height: isPhone(context) ? size.height * 0.39 : size.height * 0.29,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Image.asset(
                                    'assets/images/mehome.png',
                                    fit: BoxFit.fill,
                                    scale: 1,
                                    height: size.height * 0.38,
                                  )),
                              Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'บ้านของฉันหลังที่สอง',
                                              style: TextStyle(fontSize: 17.53, color: kSecondTextColor, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.02,
                                            ),
                                            GestureDetector(onTap: () {scan();}, child: Icon(Icons.qr_code_scanner, size: 40,))
                                          ],
                                        ),
                                        Text(
                                          'หมายเลขสถานที่',
                                          style: TextStyle(fontSize: 17.53, color: kSecondTextColor, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'BP11245644886699',
                                          style: TextStyle(
                                            fontSize: 17.53,
                                            color: kSecondTextColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'สถานที่',
                                              style: TextStyle(fontSize: 16.53, color: kSecondTextColor, fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                              child: Text(
                                                'ตั้งค่า',
                                                style: TextStyle(color: kBackgroundColor, fontSize: 16.53),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.12,
                                          width: double.infinity,
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
                                                  mapcontroller1.complete(controller);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'รายละเอียดเพิ่มเติม',
                                          style: TextStyle(fontSize: 16.53, fontWeight: FontWeight.bold, color: kSecondTextColor),
                                        ),
                                        Text(
                                          '313 อาคาร ซี.พี.ทาวเวอร์ ชั้น 24 ถนนสีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500',
                                          style: TextStyle(fontSize: 16.53, color: kSecondTextColor),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
