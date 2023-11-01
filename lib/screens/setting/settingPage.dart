import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/setting/widgets/ContainerSetting.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Text(
          'ตั้งค่า',
          style: TextStyle(fontSize: 25, color: kConkgroundColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: kConkgroundColor,
          ),
          Container(
            height: size.height * 0.82,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/icon_person.png',
                  title: 'เเก้ไขโปรไฟล์',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/icon_key.png',
                  title: 'เปลี่ยนรหัสผ่าน',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/icon_q.png',
                  title: 'เกี่ยวกับเรา',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/icon_call.png',
                  title: 'ติดต่อ',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/icon_help.png',
                  title: 'ภาษา',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/icon_logout.png',
                  title: 'ออกจากระบบ',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
