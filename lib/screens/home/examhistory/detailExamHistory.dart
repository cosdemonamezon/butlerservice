import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/examhistory/InspectorHistory.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailExamHistory extends StatefulWidget {
  const DetailExamHistory({super.key});

  @override
  State<DetailExamHistory> createState() => _DetailExamHistoryState();
}

class _DetailExamHistoryState extends State<DetailExamHistory> {
  int activeIndex = 0;
  final CarouselController _controller = CarouselController();
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
        child: Column(
          children: [
            ///////////

            CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                enlargeFactor: 0.5,
                height: size.height * 0.35,
                pageSnapping: false,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
              itemCount: homebanners.length,
              itemBuilder: (context, index, realIndex) {
                return homebanners.isNotEmpty
                    ? Center(
                        child: Image.asset(
                        '${homebanners[index]}',
                        fit: BoxFit.cover,
                      ))
                    : SizedBox.shrink();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: homebanners.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? kPointColor
                                : kBackgroundColor)
                            .withOpacity(activeIndex == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            //////
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ชื่อ',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor)),
                                Text('บ้านของฉัน A',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ชื่อเจ้าของบ้าน',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor)),
                                Text('นาย สมพร ร่ำรวย',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('หมายเลขสถานที่',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor)),
                                Text('BP11245644886699',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('สถานที่',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor))
                              ],
                            ),
                            Container(
                              height: size.height * 0.15,
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
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    mapcontroller.complete(controller);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('รายละเอียดที่ต้องการตรวจ',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor))
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ถังขยะหน้าบ้าน',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ตู้ไปรษณีย์',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ไฟหน้าบ้าน',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ประตูบ้าน',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor))
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ความถี่ในการตรวจ',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor))
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('เวลา 09.00 น. ทุกวัน',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('เวลา 18.00 น. ทุกวัน',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor))
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('กลุ่มรปภ.ที่ดูเเล',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor))
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage('assets/images/rpp.png'),
                                  ),
                                ),
                                Text('กลุ่ม มั่นคงปลอดภัย A',
                                    style: TextStyle(
                                        fontSize: 15.53,
                                        color: kSecondTextColor))
                              ],
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
                      Text('ประวัติการตรวจ',
                          style:
                              TextStyle(fontSize: 20, color: kSecondTextColor))
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InspectorHistory()));
                    },
                    child: Card(
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
                        height: size.height * 0.22,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                children: [
                                  Text('วันที่ 07/09/66 เวลา 09.00 น.',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kSecondTextColor)),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.08,
                                    width: size.width * 0.75,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 45,
                                          backgroundImage: AssetImage(
                                              'assets/images/rppEll.png'),
                                        ),
                                        Text('ผู้ตรวจ นาย สมหมาย ขยันยิ่ง',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: kSecondTextColor)),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                      'assets/icons/carbon_view-filled.png')
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Text('สถานะ :',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kSecondTextColor)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02),
                                    child: Text('ปกติ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: kSecondTextColor)),
                                  ),
                                  Image.asset(
                                      'assets/icons/icon-park-solid_check-one.png')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                      height: size.height * 0.25,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Row(
                              children: [
                                Text('วันที่ 07/09/66 เวลา 09.00 น.',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor)),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: size.height * 0.08,
                                  width: size.width * 0.75,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 45,
                                        backgroundImage: AssetImage(
                                            'assets/images/rppEll.png'),
                                      ),
                                      Text('ผู้ตรวจ นาย สมหมาย ขยันยิ่ง',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: kSecondTextColor)),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                    'assets/icons/carbon_view-filled.png')
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text('สถานะ :',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02),
                                  child: Text('ปกติ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kSecondTextColor)),
                                ),
                                Image.asset(
                                    'assets/icons/icon-park-solid_check-one.png')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
                      height: size.height * 0.25,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Row(
                              children: [
                                Text('วันที่ 07/09/66 เวลา 09.00 น.',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor)),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: size.height * 0.08,
                                  width: size.width * 0.75,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 45,
                                        backgroundImage: AssetImage(
                                            'assets/images/rppEll.png'),
                                      ),
                                      Text('ผู้ตรวจ นาย สมหมาย ขยันยิ่ง',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: kSecondTextColor)),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                    'assets/icons/carbon_view-filled.png')
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Text('สถานะ :',
                                    style: TextStyle(
                                        fontSize: 15, color: kSecondTextColor)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02),
                                  child: Text('ปกติ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kSecondTextColor)),
                                ),
                                Image.asset(
                                    'assets/icons/icon-park-solid_check-one.png')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
