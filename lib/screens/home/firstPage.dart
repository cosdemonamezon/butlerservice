import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/homePage.dart';
import 'package:butlerservice/screens/scan/scanPage.dart';
import 'package:butlerservice/screens/setting/settingPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    print(selectedIndex);
    print(0 == selectedIndex);
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
              icon: Image(image: AssetImage('assets/icons/solar_home-2-bold.png'), color: 0 == selectedIndex ? kWhite : kGrey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/icons/mdi_line-scan.png'), color: 1 == selectedIndex ? kWhite : kGrey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/icons/icon-park-solid_more-app.png'), color: 2 == selectedIndex ? kBackgroundColor : kGrey),
              label: '',
            ),
          ]),
    );
  }
}
