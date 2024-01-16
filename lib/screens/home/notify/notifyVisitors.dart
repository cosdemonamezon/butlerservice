import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NotifyVisitors extends StatefulWidget {
  const NotifyVisitors({super.key});

  @override
  State<NotifyVisitors> createState() => _NotifyVisitorsState();
}

class _NotifyVisitorsState extends State<NotifyVisitors> {
  final GlobalKey<FormState> notivisitorFormKey = GlobalKey<FormState>();
  final TextEditingController address = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController nameVisitor = TextEditingController();
  final TextEditingController relationship = TextEditingController();
  XFile? image;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'เเจ้งผู้มาเยี่ยมเจ้าบ้าน',
          style: TextStyle(color: kSecondTextColor),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/icons/chevron_left.png',
                scale: 1.3, color: kGrey)),
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
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'บ้านเลขที่',
                        style: TextStyle(
                            color: kSecondTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: address,
                    hintText: '556/55',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกบ้านเลขที่';
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
                        'ชื่อ - สกุล เจ้าบ้าน ',
                        style: TextStyle(
                            color: kSecondTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
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
                        return 'กรุณากรอกชื่อ - สกุล เจ้าบ้าน ';
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
                        'ชื่อ - สกุล ผู้มาเยี่ยมเจ้าบ้าน',
                        style: TextStyle(
                            color: kSecondTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: nameVisitor,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกชื่อ - สกุล ผู้มาเยี่ยมเจ้าบ้าน ';
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
                        'ความสัมพันธ์',
                        style: TextStyle(
                            color: kSecondTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  AppTextForm(
                    controller: relationship,
                    hintText: '',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'กรุณากรอกความสัมพันธ์';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
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
                  press: () async {
                    final img =
                        await picker.pickImage(source: ImageSource.camera);
                    setState(() {
                      image = img;
                    });
                    if (image != null) {
                      if (!mounted) return;
                      showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoQuestion(
                                title: 'บันทึกรูปสำเร็จ',
                                content: 'กดตกลง เพื่อบันทึกข้อมูล',
                                press: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FirstPage()),
                                      (route) => false);
                                },
                              ));
                    } else {
                      if (!mounted) return;
                      showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoQuestion(
                                title: 'แจ้งเตือน',
                                content: 'ไม่พบรูปภาพ',
                                press: () {
                                  Navigator.pop(context);
                                },
                              ));
                    }
                  },
                  buttonName: 'ถ่ายภาพ',
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
