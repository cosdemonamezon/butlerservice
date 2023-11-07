import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/model/location.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/screens/scan/recordWorkPage.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecordWork extends StatefulWidget {
  RecordWork({super.key, this.listlocation});
  Location? listlocation;

  @override
  State<RecordWork> createState() => _RecordWorkState();
}

class _RecordWorkState extends State<RecordWork> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      // เพิ่มปักหมุดที่ตำแหน่งที่กำหนด
      markers.add(
        Marker(
          markerId: MarkerId('SomeId'),
          position:
              LatLng(widget.listlocation!.lat!, widget.listlocation!.lon!),
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
                //Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                    (route) => false);
              },
              child: Image.asset(
                'assets/icons/chevron_w.png',
                scale: 1.3,
              ))),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          Container(
            height: size.height * 0.80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.72,
                  width: double.infinity,
                  child: GoogleMap(
                    onTap: (argument) {},
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          widget.listlocation!.lat!, widget.listlocation!.lon!),
                      zoom: 16,
                    ),
                    markers: markers,
                    onMapCreated: _onMapCreated,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Text(
                      'กรุณายืนภายในระยะ 500 เมตร',
                      style: TextStyle(
                        color: kConkgroundColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
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
                            builder: (context) => RecordWorkPage(
                                  listlocation: widget.listlocation,
                                )));
                  },
                  buttonName: 'ถัดไป',
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
