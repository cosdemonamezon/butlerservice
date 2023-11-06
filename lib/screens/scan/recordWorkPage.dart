import 'dart:async';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/scan/recordSuccess.dart';
import 'package:butlerservice/utils/date_utils.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RecordWorkPage extends StatefulWidget {
  const RecordWorkPage({super.key});

  @override
  State<RecordWorkPage> createState() => _RecordWorkPageState();
}

class _RecordWorkPageState extends State<RecordWorkPage> {
  final GlobalKey<FormState> recordFormKey = GlobalKey<FormState>();
  final TextEditingController locationNumber = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController memberId = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController remark = TextEditingController();
  late GoogleMapController mapController;
  Set<Marker> markers = Set();
  DateTime? datetime = DateTime.now();
  ImagePicker picker = ImagePicker();
  List<XFile> image = [];
  Map<String, dynamic> workuser = {};
  DateTime _selectedTime = DateTime.now();

  Completer<GoogleMapController> mapcontroller = Completer();

  Future<void> openDialogImage(int imageSelect) async {
    final result = await showModalActionSheet<String>(
      context: context,
      title: 'เลือกรูปภาพ',
      cancelLabel: 'ยกเลิก',
      actions: [
        SheetAction<String>(label: 'ถ่ายรูป', key: 'camera'),
        // SheetAction<String>(label: 'เลือกจากอัลบั้ม', key: 'gallery'),
      ],
    );
    if (result != null) {
      if (result == 'camera') {
        final img = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          if (imageSelect == 1 && img != null) {
            image.add(img);
          }
        });
      }

      // if (result == 'gallery') {
      //   final img = await picker.pickImage(source: ImageSource.gallery);
      //   setState(() {
      //     if (imageSelect == 1 && img != null) {
      //       image.add(img);
      //     }
      //   });
      // }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      // เพิ่มปักหมุดที่ตำแหน่งที่กำหนด
      markers.add(
        Marker(
          markerId: MarkerId('SomeId'),
          position: LatLng(13.7650836, 100.5379664),
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
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/chevron_w.png',
              scale: 1.3,
            ),
          )),
      body: Form(
        key: recordFormKey,
        child: Stack(
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
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'หมายเลขสถานที่',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    AppTextForm(
                      controller: locationNumber,
                      hintText: 'BP11245644886699',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'กรุณากรอกหมายเลขสถานที่';
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
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      height: size.height * 0.16,
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
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
                            markers: markers,
                            onMapCreated: _onMapCreated,
                          ),
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
                          'ชื่อ - สกุล',
                          style: TextStyle(
                              color: kConkgroundColor,
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
                      hintText: 'ระบุชื่อ - นามสกุล',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'กรุณากรอกชื่อ - สกุล';
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
                          'รหัสสมาชิก',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    AppTextForm(
                      controller: memberId,
                      hintText: 'ระบุรหัสสมาชิก',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'กรุณากรอกรหัสสมาชิก';
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
                          'วันที่',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                            controller: date,
                            style: TextStyle(color: kSecondTextColor),
                            decoration: InputDecoration(
                                hintText: date.text,
                                suffixIcon: IconButton(
                                    color: Color(0xff9E9E9E),
                                    onPressed: () async {
                                      date.text =
                                          datetime!.formatTo('dd-MM-yyyy ');
                                      DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );

                                      // Cancel
                                      if (newDate == null) return;

                                      setState(() {
                                        datetime = newDate;
                                      });
                                      print(date);
                                    },
                                    icon: Icon(
                                      Icons.calendar_month,
                                      color: Colors.black,
                                    )),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Color(0xff9E9E9E)))),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'เวลา',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                            readOnly: true,
                            controller: time,
                            style: TextStyle(color: kSecondTextColor),
                            onTap: () async {},
                            decoration: InputDecoration(
                                hintText: date.text,
                                suffixIcon: IconButton(
                                    color: Color(0xff9E9E9E),
                                    onPressed: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            _selectedTime),
                                      );
                                      if (pickedTime != null) {
                                        setState(() {
                                          _selectedTime = DateTime(
                                            _selectedTime.year,
                                            _selectedTime.month,
                                            _selectedTime.day,
                                            pickedTime.hour,
                                            pickedTime.minute,
                                          );
                                          time.text =
                                              '${_selectedTime.hour}:${_selectedTime.minute}';
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.access_time,
                                      color: Colors.black,
                                    )),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Color(0xff9E9E9E)))),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'รายละเอียดในการตรวจ',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
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
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            reportCheck.length,
                            (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.01,
                                      horizontal: size.width * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        reportCheck[index]['text'],
                                        style: TextStyle(
                                            color: kTextColor, fontSize: 16),
                                      ),
                                      Image.asset(
                                          'assets/icons/icon-park-solid_check-one.png'),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'รูปถ่าย',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        image.isNotEmpty
                            ? Flexible(
                                child: Column(
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(
                                          image.length,
                                          (index) => Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: SizedBox(
                                                      width: size.width * 0.20,
                                                      height:
                                                          size.height * 0.12,
                                                      child: AspectRatio(
                                                        aspectRatio: 1,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image(
                                                            image: FileImage(
                                                              File(image[index]
                                                                  .path),
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 10,
                                                      left: 60,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            image.removeAt(
                                                                index);
                                                          });
                                                        },
                                                        child: Icon(
                                                            Icons.cancel,
                                                            color:
                                                                kBackgroundColor),
                                                      )),
                                                ],
                                              )),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        GestureDetector(
                          onTap: () => openDialogImage(1),
                          child: Container(
                            height: size.height * 0.12,
                            width: size.width * 0.20,
                            decoration: BoxDecoration(
                              //color: kBackgroundColor,

                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Image.asset('assets/icons/Rectangle 7 (1).png'),
                                Center(
                                    child:
                                        Image.asset('assets/icons/add_w.png')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'สถานการณ์',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonMiniOnClick(
                          size: size,
                          press: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                          },
                          buttonName: 'ปกติ',
                          backgroundColor: kBtnMiniColor,
                        ),
                        ButtonMiniOnClick(
                          size: size,
                          press: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                          },
                          buttonName: 'ไม่ปกติ',
                          backgroundColor: kBackgroundColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'บันทึกรายละเอียดเพิ่มเติม',
                          style: TextStyle(
                              color: kConkgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    AppTextForm(
                      controller: remark,
                      hintText: 'กรุณากรอกรายละเอียด',
                      maxline: 5,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'กรุณากรอกบันทึกรายละเอียดเพิ่มเติม';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
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
                      if (recordFormKey.currentState!.validate()) {
                        setState(() {
                          workuser = {
                            'locationNumber': locationNumber.text,
                            'location': location.text,
                            'name': name.text,
                            'memberId': memberId.text,
                            'date': date.text,
                            'time': time.text,
                            'remark': remark.text,
                          };
                        });
                        if (image.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecordSuccess(
                                        image: image,
                                        regisuserdata: workuser,
                                      )));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => CupertinoQuestion(
                              title: 'ผิดพลาด',
                              content: 'กรุณาถ่ายรูปภาพ',
                              press: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        }
                      }
                    },
                    buttonName: 'บันทึก',
                    backgroundColor: kBtnMiniColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
