import 'package:butlerservice/constants.dart';
import 'package:butlerservice/controllers/appController.dart';
import 'package:butlerservice/screens/home/homePage.dart';
import 'package:butlerservice/screens/scan/scanPage.dart';
import 'package:butlerservice/screens/setting/settingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final PageStorageBucket bucket = PageStorageBucket();
  Color? color;
  Widget currentScreen = HomePage();

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        currentScreen = HomePage();
      } else if (selectedIndex == 1) {
        currentScreen = ScanPage();
      } else if (selectedIndex == 2) {
        currentScreen = SettingPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: selectedIndex == 2 ? kConkgroundColor : kBackgroundColor,
          // selectedItemColor: selectedIndex == 2 ? kBackgroundColor : kConkgroundColor,
          currentIndex: selectedIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/solar_home-2-bold.ico', scale: 3, color: 0 == selectedIndex ? kWhite : kGrey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/mdi_line-scan.ico', scale: 3, color: 1 == selectedIndex ? kWhite : kGrey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/icon-park-solid_more-app.ico', scale: 3, color: 2 == selectedIndex ? kBackgroundColor : kGrey),
              label: '',
            ),
          ]),
    );
  }
}
