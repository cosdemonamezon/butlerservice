import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/homePage.dart';
import 'package:butlerservice/screens/scan/scanPage.dart';
import 'package:butlerservice/screens/setting/settingPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final PageStorageBucket bucket = PageStorageBucket();
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
          backgroundColor: selectedIndex == 2 ?kConkgroundColor :kBackgroundColor,
          selectedItemColor: selectedIndex == 2 ?kBackgroundColor :kConkgroundColor,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          currentIndex: selectedIndex,
          showUnselectedLabels: true,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.center_focus_strong,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
                size: 30,
              ),
              label: '',
            ),
          ]),
    );
  }
}
