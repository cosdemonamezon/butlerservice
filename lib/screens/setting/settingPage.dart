import 'package:butlerservice/constants.dart';
import 'package:butlerservice/controllers/appController.dart';
import 'package:butlerservice/screens/auth/loginPage.dart';
import 'package:butlerservice/screens/setting/widgets/ContainerSetting.dart';
import 'package:butlerservice/utils/screen_utils.dart';
import 'package:butlerservice/widget/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            style: TextStyle(fontSize: 24, color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_w.png',
                  color: kWhite, scale: 1.3))),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.8,
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
                  leadingIcon: 'assets/icons/iconamoon_profile-bold.ico',
                  title: 'เเก้ไขโปรไฟล์',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/carbon_password.ico',
                  title: 'เปลี่ยนรหัสผ่าน',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/Vector11.ico',
                  title: 'เกี่ยวกับเรา',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/ion_call-outline.ico',
                  title: 'ติดต่อ',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                  size: size,
                  leadingIcon: 'assets/icons/grommet-icons_language.ico',
                  title: 'ภาษา',
                  trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                  press: () {},
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ContainerSetting(
                    size: size,
                    leadingIcon: 'assets/icons/ic_outline-logout.ico',
                    title: 'ออกจากระบบ',
                    trailingIcon: 'assets/icons/ion_chevron_back_blue.png',
                    press: () async {
                      final isLogout = await Dialogs.logout(context);
                      if (mounted && isLogout) {
                        context.read<AppController>().logout();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
