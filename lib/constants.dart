import 'package:flutter/material.dart';

const baseUrl = 'https://asha-tech.co.th/butler/api/public';

const kBackgroundColor = Color(0xff1B58B1);
const kSecondTextColor = Color(0xff7B7B7B);
const kConkgroundColor = Color(0xffFFFFFF);
const kPointColor = Color(0xffDEDBDB);
const kBtnMiniColor = Color(0xffFF9F43);
const kTextColor = Color(0xff0D9F00);
const kTextShowColor = Color(0xff7A7A7A);
const kTextAddColor = Color(0xff14407F);
const kRed = Colors.red;
const kBlack = Colors.black;
const kTransparent = Colors.transparent;
const kGrey = Colors.grey;
const kWhite = Colors.white;

bool isPhone(BuildContext context) => MediaQuery.of(context).size.shortestSide < 550;

const List<String> banners = [
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
];

const List<String> homebanners = [
  'assets/images/mehomeRectangle.png',
  'assets/images/mehomeRectangle.png',
  'assets/images/mehomeRectangle.png',
  'assets/images/mehomeRectangle.png',
  'assets/images/mehomeRectangle.png',
];

const List<Map<String, dynamic>> customer = [
  {'id': 1, 'image': 'assets/icons/mdi_add-location.ico', 'text': 'ลงทะเบียน \n สถานที่'},
  {'id': 2, 'image': 'assets/icons/Vector.ico', 'text': 'จัดการ \n สถานที่ของฉัน'},
  {'id': 3, 'image': 'assets/icons/mdi_file-report.ico', 'text': 'ประวัติ \n การตรวจ'},
  {'id': 4, 'image': 'assets/icons/akar-icons_stop-fill.ico', 'text': 'ร้องเรียน'}
];

const List<Map<String, dynamic>> members = [
  {'id': 1, 'image': 'assets/images/per1.png', 'name': 'นาย มั่นคง ขยันยิ่ง'},
  {'id': 2, 'image': 'assets/images/per2.png', 'name': 'นาย มุ่งมั่น ขยันยิ่ง'},
  {'id': 3, 'image': 'assets/images/per3.png', 'name': 'นาย สมพร รัศมี'},
  {'id': 4, 'image': 'assets/images/per4.png', 'name': 'นาย อุษมา มัศโอดี'}
];

const List<Map<String, dynamic>> reportCheck = [
  {'id': 1, 'text': 'ถังขยะหน้าบ้าน'},
  {'id': 2, 'text': 'ตู้ไปรษณีย์'},
  {'id': 3, 'text': 'ไฟหน้าบ้าน'},
  {'id': 4, 'text': 'ประตูบ้าน'}
];

const List<Map<String, dynamic>> patrol = [
  {'id': 1, 'image': 'assets/icons/fluent_folder-people-20-filled.ico', 'text': 'รายงาน \n ผลตรวจ'},
  {'id': 2, 'image': 'assets/icons/fluent_people-settings-24-filled.ico', 'text': 'ตั้งค่า \n กลุ่มงาน'},
  {'id': 3, 'image': 'assets/icons/mdi_file-report.ico', 'text': 'ประวัติ \n การตรวจ'},
];

const List<Map<String, dynamic>> officer = [
  {'id': 1, 'image': 'assets/icons/mdi_file-report.ico', 'text': 'รายการตรวจ \n ประจำวัน'},
  {'id': 2, 'image': 'assets/icons/Vector_1.ico', 'text': 'เเจ้งผู้มาเยี่ยม \n เจ้าบ้าน'},
  {'id': 3, 'image': 'assets/icons/mdi_file-report.ico', 'text': 'ประวัติ \n การตรวจ'},
  {'id': 4, 'image': 'assets/icons/akar-icons_stop-fill.ico', 'text': 'เเจ้งหยุดงาน'},
];

const List<Map<String, dynamic>> iconImage = [
  {'id': 1, 'icon': 'assets/icons/ion_home.png', 'text': 'บ้านเดี่ยว'},
  {'id': 2, 'icon': 'assets/icons/bxs_building.png', 'text': 'อาคาร'},
  {'id': 3, 'icon': 'assets/icons/ion_condo.png', 'text': 'คอนโด'},
  {'id': 4, 'icon': 'assets/icons/ion_office.png', 'text': 'ออฟฟิศ'},
  {'id': 5, 'icon': 'assets/icons/ion_factory.png', 'text': 'โรงงาน'}
];
