import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/screens/scan/recordWorkPage.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecordWork extends StatefulWidget {
  const RecordWork({super.key});

  @override
  State<RecordWork> createState() => _RecordWorkState();
}

class _RecordWorkState extends State<RecordWork> {
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
                //Navigator.pop(context);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
              },
              child: Image.asset('assets/icons/chevron_w.png'))),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            
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
            child: Column(
              children: [
                Container(
                  height: size.height * 0.72,
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
            bottom: size.height * 0.02,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Center(
                child: ButtonBigOnClick(
                  size: size,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
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
