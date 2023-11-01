import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ManagePlaces extends StatefulWidget {
  const ManagePlaces({super.key});

  @override
  State<ManagePlaces> createState() => _ManagePlacesState();
}

class _ManagePlacesState extends State<ManagePlaces> {
  Completer<GoogleMapController> mapcontroller = Completer();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'จัดการสถานที่ของฉัน',
          style: TextStyle(fontSize: 25, color: kSecondTextColor),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/icons/chevron_left.png')),
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
                horizontal: size.width * 0.04,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(height: size.height * 0.01,),
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
                      height: size.height * 0.32,
                      width: size.width * 0.38,
                      child: Row(
                        children: [
                          Expanded(flex: 4, child: Image.asset('assets/images/mehome.png')),
                          Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'บ้านของฉัน',
                                        style: TextStyle(fontSize: 13.53),
                                      ),
                                      Icon(Icons.edit)
                                    ],
                                  ),
                                  Text(
                                    'หมายเลขสถานที่',
                                    style: TextStyle(fontSize: 13.53),
                                  ),
                                  Text(
                                    'BP11245644886699',
                                    style: TextStyle(fontSize: 13.53),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'สถานที่',
                                        style: TextStyle(fontSize: 12.53),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                        child: Text(
                                          'ตั้งค่า',
                                          style: TextStyle(color: kBackgroundColor, fontSize: 10.53),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: size.height * 0.12,
                                    width: double.infinity,
                                    //color: Colors.blue,
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
                                  Text(
                                    'รายละเอียดเพิ่มเติม',
                                    style: TextStyle(fontSize: 12.53),
                                  ),
                                  Text(
                                    '313 อาคาร ซี.พี.ทาวเวอร์ ชั้น 24 ถนนสีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500',
                                    style: TextStyle(fontSize: 10.53),
                                  ),
                                ],
                              ))
                        ],
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
