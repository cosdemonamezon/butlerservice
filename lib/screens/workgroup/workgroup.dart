import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/workgroup/addMemberGroup.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Workgroup extends StatefulWidget {
  const Workgroup({super.key});

  @override
  State<Workgroup> createState() => _WorkgroupState();
}

class _WorkgroupState extends State<Workgroup> {
  final GlobalKey<FormState> workgroupFormKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController detail = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController remark = TextEditingController();
  Completer<GoogleMapController> mapcontroller = Completer();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: Text(
            'ตั้งค่ากลุ่มงาน',
            style: TextStyle(fontSize: 25, color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_w.png'))),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: kConkgroundColor,
          ),
          Container(
            height: size.height * 0.80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                      width: size.width * 0.20,
                      height: size.height * 0.20,
                      decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/images/yam1.png")))),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อกลุ่ม',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: name,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกชื่อกลุ่ม';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'สถานที่',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
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
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'รายละเอียดสถานที่',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: detail,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกรายละเอียดสถานที่';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'วันต้องการตรวจ',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.13,
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('จันทร์'),
                                  Text('พุธ'),
                                  Text('ศุกร์'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.03),
                              child: Image.asset('assets/icons/solar_calendar_bold.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'เวลาที่ต้องการตรวจ',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: time,
                    hintText: '13.00',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกเวลาที่ต้องการตรวจ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'สมาชิกภายในกลุ่ม',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    children: List.generate(
                        members.length,
                        (index) => ListTile(
                              leading: Image.asset(members[index]['image']),
                              title: Text(
                                members[index]['name'],
                                style: TextStyle(color: kConkgroundColor),
                              ),
                              trailing: Image.asset('assets/icons/icon_set.png'),
                            )),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/icons/long_rac.png'),
                      Image.asset('assets/icons/flat_color_icons_plus.png'),
                      Image.asset('assets/icons/long_rac.png'),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddMemberGroup()));
                    },
                    child: Center(
                      child: Text(
                        'เพิ่มสมาชิก',
                        style: TextStyle(color: kTextAddColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'บันทึกรายละเอียดเพิ่มเติม',
                        style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: remark,
                    hintText: '',
                    maxline: 5,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกบันทึกรายละเอียดเพิ่มเติม';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Center(
                child: ButtonBigOnClick(
                  size: size,
                  press: () {},
                  buttonName: 'บันทึก',
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
