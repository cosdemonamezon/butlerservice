import 'dart:async';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/model/location.dart';
import 'package:butlerservice/screens/scan/recordSuccess.dart';
import 'package:butlerservice/utils/date_utils.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/GooglemapPage.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RecordWorkPage extends StatefulWidget {
  RecordWorkPage({super.key, this.listlocation});
  Location? listlocation;

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
  bool enable = true;
  bool enable1 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  Completer<GoogleMapController> mapcontroller = Completer();

  @override
  void initState() {
    super.initState();
    setState(() {
      locationNumber.text = 'BP11245644886699';
    });
  }

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
          position: LatLng(13.7442, 100.4608),
          infoWindow: InfoWindow(title: 'ชื่อสถานที่', snippet: 'รายละเอียดเพิ่มเติม'),
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
                            'locationNumber': 'BP11245644886699',
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
                                        listlocation: widget.listlocation,
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    AppTextForm(
                      enabled: false,
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
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
                              target: LatLng(13.7442, 100.4608),
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      width: size.width * 0.9,
                      height: size.height * 0.06,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Center(
                          child: TextFormField(
                              controller: date,
                              style: TextStyle(color: kSecondTextColor, fontSize: 18.53),
                              decoration: InputDecoration(
                                  hintText: date.text,
                                  suffixIcon: IconButton(
                                      color: Color(0xff9E9E9E),
                                      onPressed: () async {
                                        date.text = datetime!.formatTo('dd-MM-yyyy ');
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
                                        size: isPhone(context) ? 25 : 40,
                                      )),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 18.53, color: Color(0xff9E9E9E)))),
                        ),
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      width: size.width * 0.9,
                      height: size.height * 0.06,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Center(
                          child: TextFormField(
                              readOnly: true,
                              controller: time,
                              style: TextStyle(color: kSecondTextColor, fontSize: 18.53),
                              onTap: () async {},
                              decoration: InputDecoration(
                                  hintText: time.text,
                                  suffixIcon: IconButton(
                                      color: Color(0xff9E9E9E),
                                      onPressed: () async {
                                        TimeOfDay? pickedTime = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(_selectedTime),
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
                                            time.text = '${_selectedTime.hour}:${_selectedTime.minute}';
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        Icons.access_time,
                                        color: Colors.black,
                                        size: isPhone(context) ? 25 : 40,
                                      )),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 18.53, color: Color(0xff9E9E9E)))),
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
                          'รายละเอียดในการตรวจ',
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: Text(
                                    'ถังขยะหน้าบ้าน',
                                    style: TextStyle(fontSize: 18.53, color: kSecondTextColor),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked1 = !isChecked1;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isChecked1 ? Colors.green : Colors.transparent,
                                        border: Border.all(
                                          color: isChecked1 ? Colors.green : Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      width: 30.0,
                                      height: 30.0,
                                      child: isChecked1
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 20.0,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                //   child: Image.asset('assets/icons/icon-park-solid_check-one.png'),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: Text(
                                    'ตู้ไปรษณีย์',
                                    style: TextStyle(fontSize: 18.53, color: kSecondTextColor),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked2 = !isChecked2;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isChecked2 ? Colors.green : Colors.transparent,
                                        border: Border.all(
                                          color: isChecked2 ? Colors.green : Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      width: 30.0,
                                      height: 30.0,
                                      child: isChecked2
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 20.0,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                //   child: Image.asset('assets/icons/icon-park-solid_check-one.png'),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: Text(
                                    'ไฟหน้าบ้าน',
                                    style: TextStyle(fontSize: 18.53, color: kSecondTextColor),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked3 = !isChecked3;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isChecked3 ? Colors.green : Colors.transparent,
                                        border: Border.all(
                                          color: isChecked3 ? Colors.green : Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      width: 30.0,
                                      height: 30.0,
                                      child: isChecked3
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 20.0,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                //   child: Image.asset('assets/icons/icon-park-solid_check-one.png'),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: Text(
                                    'ประตูบ้าน',
                                    style: TextStyle(fontSize: 18.53, color: kSecondTextColor),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked4 = !isChecked4;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isChecked4 ? Colors.green : Colors.transparent,
                                        border: Border.all(
                                          color: isChecked4 ? Colors.green : Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      width: 30.0,
                                      height: 30.0,
                                      child: isChecked4
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 20.0,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                //   child: Image.asset('assets/icons/icon-park-solid_check-one.png'),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
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
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: SizedBox(
                                                      width: size.width * 0.20,
                                                      height: size.height * 0.12,
                                                      child: AspectRatio(
                                                        aspectRatio: 1,
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(10),
                                                          child: Image(
                                                            image: FileImage(
                                                              File(image[index].path),
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 10,
                                                      right: 20,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            image.removeAt(index);
                                                          });
                                                        },
                                                        child: Icon(Icons.cancel, color: kBackgroundColor),
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
                            height: size.height * 0.1,
                            width: size.width * 0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/icons/Rectangle 7 (1).png'),
                                Center(child: Icon(Icons.add, color: kWhite, size: 40)),
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
                          style: TextStyle(color: kConkgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonMiniOnClick(
                          size: size,
                          press: () {
                            setState(() {
                              enable = false;
                              enable1 = true;
                            });
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                          },
                          buttonName: 'ไม่ปกติ',
                          backgroundColor: enable1 ? Colors.green : kGrey,
                        ),
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        ButtonMiniOnClick(
                          size: size,
                          press: () {
                            setState(() {
                              enable = true;
                              enable1 = false;
                            });
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWorkPage()));
                          },
                          buttonName: 'ปกติ',
                          backgroundColor: enable ? Colors.green : kGrey,
                        ),
                      ],
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
          ],
        ),
      ),
    );
  }
}
