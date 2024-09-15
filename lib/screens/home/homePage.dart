import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/controllers/appController.dart';
import 'package:butlerservice/model/user.dart';
import 'package:butlerservice/screens/Inspecreport/inspecReport.dart';
import 'package:butlerservice/screens/Inspecreport/inspectionlist.dart';
import 'package:butlerservice/screens/home/appealPage.dart';
import 'package:butlerservice/screens/home/examhistory/examHistory.dart';
import 'package:butlerservice/screens/home/notify/notifyVisitors.dart';
import 'package:butlerservice/screens/home/widgets/AlertDialogReport.dart';
import 'package:butlerservice/screens/home/widgets/ShowContainerWidget.dart';
import 'package:butlerservice/screens/manageplaces/managePlaces.dart';
import 'package:butlerservice/screens/place/placeRegister.dart';
import 'package:butlerservice/screens/workgroup/setupWorkgroups.dart';
import 'package:butlerservice/screens/workstop/workstopCalendarPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  int activeIndex = 0;
  User? user;
  ImagePicker picker = ImagePicker();
  List<XFile> image = [];
  String checkUser = '';

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    //user = context.read<AppController>().user;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final _checkUser = prefs.getString('user');
    setState(() {
      checkUser = _checkUser!;
    });
  }

  Future<void> openDialogImage(int imageSelect) async {
    final result = await showModalActionSheet<String>(
      context: context,
      title: 'เลือกรูปภาพ',
      cancelLabel: 'ยกเลิก',
      actions: [
        SheetAction<String>(label: 'ถ่ายรูป', key: 'camera'),
        SheetAction<String>(label: 'เลือกจากอัลบั้ม', key: 'gallery'),
      ],
    );
    if (result != null) {
      if (result == 'camera') {
        final img = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          if (imageSelect == 1 && img != null) {
            if (image.isNotEmpty) {
              image.clear();
              image.add(img);
            } else {
              image.add(img);
            }
          }
        });
      }

      if (result == 'gallery') {
        final img = await picker.pickImage(source: ImageSource.gallery);
        setState(() {
          if (imageSelect == 1 && img != null) {
            if (image.isNotEmpty) {
              image.clear();
              image.add(img);
            } else {
              image.add(img);
            }
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.91,
            width: size.width,
            decoration: BoxDecoration(
              color: kConkgroundColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => openDialogImage(1),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: 64,
                                      height: 64,
                                      child: image.isNotEmpty
                                          ? CircleAvatar(
                                              radius: 32,
                                              backgroundColor: kTransparent,
                                              backgroundImage: FileImage(File(image[0].path)),
                                            )
                                          : CircleAvatar(
                                              radius: 32,
                                              backgroundColor: kTransparent,
                                              backgroundImage: AssetImage('assets/images/rppEll.png'),
                                            ),
                                    ),
                                    Positioned(
                                      height: 25,
                                      width: 25,
                                      bottom: 0,
                                      right: 0,
                                      child: Image.asset(
                                        'assets/icons/solar_camera-minimalistic-bold.ico',
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'สวัสดี!',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      // Text(user!.name,
                                      //     style: TextStyle(
                                      //         color: kBackgroundColor,
                                      //         fontSize: 20,
                                      //         fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  showDialog(context: context, builder: (context) => AlertDialogReport());
                                },
                                icon: Image.asset('assets/icons/Notification.ico', scale: 2.5)),
                            Positioned(
                                right: 5,
                                child: CircleAvatar(
                                  radius: 11,
                                  child: Center(child: Text('1')),
                                ))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ///////////

                    CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 20 / 10,
                        //height: size.height * 0.55,
                        pageSnapping: false,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) => setState(() => activeIndex = index),
                      ),
                      itemCount: banners.length,
                      itemBuilder: (context, index, realIndex) {
                        return banners.isNotEmpty
                            ? Center(
                                child: Image.asset(
                                height: size.height * 0.33,
                                '${banners[index]}',
                                fit: BoxFit.fill,
                              ))
                            : SizedBox.shrink();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: banners.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: (Theme.of(context).brightness == Brightness.dark ? kPointColor : kBackgroundColor).withOpacity(activeIndex == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    //////
                    checkUser == 'admin' || checkUser == 'customer'
                        ? Row(
                            children: [
                              Text(
                                'สำหรับลูกค้า',
                                style: TextStyle(color: kBackgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    checkUser == 'admin' || checkUser == 'customer'
                        ? Container(
                            height: size.height * 0.12,
                            child: ListView.builder(
                                primary: false,
                                shrinkWrap: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: customer.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                    child: ShowContainerWidget(
                                      size: size,
                                      image: customer[index]['image'],
                                      text: customer[index]['text'],
                                      press: () {
                                        if (customer[index]['id'] == 1) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceRegister()));
                                        } else if (customer[index]['id'] == 2) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ManagePlaces()));
                                        } else if (customer[index]['id'] == 3) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Examhistory()));
                                        } else {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => AppealPage()));
                                        }
                                      },
                                    ),
                                  );
                                }),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    //////
                    checkUser == 'admin' || checkUser == 'patrol'
                        ? Row(
                            children: [
                              Text(
                                'สำหรับสายตรวจ',
                                style: TextStyle(color: kBackgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    checkUser == 'admin' || checkUser == 'patrol'
                        ? Container(
                            height: size.height * 0.12,
                            child: ListView.builder(
                                primary: false,
                                shrinkWrap: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: patrol.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                    child: ShowContainerWidget(
                                      size: size,
                                      image: patrol[index]['image'],
                                      text: patrol[index]['text'],
                                      press: () {
                                        if (patrol[index]['id'] == 1) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => InspecReport()));
                                        } else if (patrol[index]['id'] == 2) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SetupWorkgroups()));
                                        } else if (patrol[index]['id'] == 3) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Examhistory()));
                                        } else {}
                                      },
                                    ),
                                  );
                                }),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    //////
                    checkUser == 'admin' || checkUser == 'officer'
                        ? Row(
                            children: [
                              Text(
                                'สำหรับเจ้าหน้าที่',
                                style: TextStyle(color: kBackgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    checkUser == 'admin' || checkUser == 'officer'
                        ? Container(
                            height: size.height * 0.12,
                            child: ListView.builder(
                                primary: false,
                                shrinkWrap: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: officer.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                    child: ShowContainerWidget(
                                      size: size,
                                      image: officer[index]['image'],
                                      text: officer[index]['text'],
                                      press: () {
                                        if (officer[index]['id'] == 1) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => InspectionList()));
                                        } else if (officer[index]['id'] == 2) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotifyVisitors()));
                                        } else if (officer[index]['id'] == 3) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Examhistory()));
                                        } else if (officer[index]['id'] == 4) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkstopCalendarPage()));
                                        } else {}
                                      },
                                    ),
                                  );
                                }),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
