import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/workgroup/workgroup.dart';
import 'package:flutter/material.dart';

class SetupWorkgroups extends StatefulWidget {
  const SetupWorkgroups({super.key});

  @override
  State<SetupWorkgroups> createState() => _SetupWorkgroupsState();
}

class _SetupWorkgroupsState extends State<SetupWorkgroups> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kConkgroundColor,
          centerTitle: true,
          title: Text(
            'ตั้งค่ากลุ่มงาน',
            style: TextStyle(color: kSecondTextColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_left.png', scale: 1.3))),
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
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Workgroup()));
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                            horizontal: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: kConkgroundColor,
                                      backgroundImage:
                                          AssetImage('assets/images/rpp.png'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'กลุ่ม มั่นคงปลอดภัย A',
                                      style: TextStyle(
                                          color: kBackgroundColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.53),
                                    )
                                  ],
                                ),
                                Image.asset(
                                    'assets/icons/icon_park_setting.png')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'รหัสประจำกลุ่ม : AB44556677',
                                  style: TextStyle(
                                      color: kSecondTextColor,
                                      height: 2,
                                      fontSize: 18.53),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('สถานที่ : หมู่บ้าน ชลบุรี-บางนา',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('หัวหน้ากลุ่ม : นาย อุบล เเต้พาณิช',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('วันที่ตรวจ : จันทร์ พุธ ศุกร์',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('เวลาตรวจ : 13.00 น.',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Workgroup()));
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                            horizontal: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.005),
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: kConkgroundColor,
                                        backgroundImage: AssetImage(
                                            'assets/images/rrrt.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'กลุ่ม มั่นคงปลอดภัย B',
                                      style: TextStyle(
                                          color: kBackgroundColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.53),
                                    )
                                  ],
                                ),
                                Image.asset(
                                    'assets/icons/icon_park_setting.png')
                              ],
                            ),
                            Row(
                              children: [
                                Text('รหัสประจำกลุ่ม : AB44556699',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('สถานที่ : หมู่บ้าน ชลบุรี-บางพลี',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('หัวหน้ากลุ่ม : นาย รัศมี อิมพลี',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('วันที่ตรวจ : พฤหัสบดี เสาร์',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('เวลาตรวจ : 13.00 น.',
                                    style: TextStyle(
                                        color: kSecondTextColor,
                                        height: 2,
                                        fontSize: 18.53)),
                              ],
                            )
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
