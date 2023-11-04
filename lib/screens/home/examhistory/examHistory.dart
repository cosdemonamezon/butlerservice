import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/examhistory/detailExamHistory.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Examhistory extends StatefulWidget {
  const Examhistory({super.key});

  @override
  State<Examhistory> createState() => _ExamhistoryState();
}

class _ExamhistoryState extends State<Examhistory> {
  Completer<GoogleMapController> mapcontroller = Completer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ประวัติการตรวจ',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailExamHistory()));
                      },
                      child: Container(
                        width: size.width * 0.38,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Image.asset('assets/images/mehome.png')),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'สถานที่',
                                          style: TextStyle(fontSize: 12.53),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.01),
                                          child: Text(
                                            'ตั้งค่า',
                                            style: TextStyle(
                                                color: kBackgroundColor,
                                                fontSize: 10.53),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: GoogleMap(
                                            onTap: (argument) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GooglemapPage(
                                                            latitude:
                                                                13.7650836,
                                                            longitude:
                                                                100.5379664,
                                                          )));
                                            },
                                            zoomControlsEnabled: false,
                                            mapType: MapType.normal,
                                            initialCameraPosition:
                                                CameraPosition(
                                              target: LatLng(
                                                  13.7650836, 100.5379664),
                                              zoom: 16,
                                            ),
                                            onMapCreated: (GoogleMapController
                                                controller) {
                                              mapcontroller
                                                  .complete(controller);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'รายละเอียดเพิ่มเติม',
                                      style: TextStyle(
                                          fontSize: 12.53,
                                          fontWeight: FontWeight.bold),
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
