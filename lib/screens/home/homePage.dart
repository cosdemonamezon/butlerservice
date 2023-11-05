import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/Inspecreport/inspecReport.dart';
import 'package:butlerservice/screens/home/examhistory/examHistory.dart';
import 'package:butlerservice/screens/home/examhistory/mapText.dart';
import 'package:butlerservice/screens/home/notify/notifyVisitors.dart';
import 'package:butlerservice/screens/home/widgets/ShowContainerWidget.dart';
import 'package:butlerservice/screens/manageplaces/managePlaces.dart';
import 'package:butlerservice/screens/place/placeRegister.dart';
import 'package:butlerservice/screens/workgroup/setupWorkgroups.dart';
import 'package:butlerservice/screens/workstop/workstopPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: kBackgroundColor,
          ),
          Container(
            height: size.height * 0.90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kConkgroundColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0xAA6EB1E6),
              //     offset: Offset(9, 9),
              //     blurRadius: 6,
              //   ),
              // ],
            ),
            alignment: Alignment.center,
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
                        SizedBox(
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 64,
                                    height: 64,
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundColor: kTransparent,
                                      child: Image.asset(
                                          'assets/images/rppEll.png'),
                                    ),
                                  ),
                                  Positioned(
                                    height: 25,
                                    width: 25,
                                    bottom: 0,
                                    right: 0,
                                    child: Image.asset(
                                        'assets/icons/solar_camera-minimalistic-bold.png'),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'สวัสดี!',
                                      style: TextStyle(fontSize: 19.91),
                                    ),
                                    Text('สมชาย ขยันเเจ้ง',
                                        style: TextStyle(
                                            color: kBackgroundColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/Notification.png'))
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
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                      itemCount: banners.length,
                      itemBuilder: (context, index, realIndex) {
                        return banners.isNotEmpty
                            ? Center(
                                child: Image.asset(
                                '${banners[index]}',
                                fit: BoxFit.cover,
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
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? kPointColor
                                        : kBackgroundColor)
                                    .withOpacity(
                                        activeIndex == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    //////
                    Row(
                      children: [
                        Text(
                          'สำหรับลูกค้า',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Container(
                      height: size.height * 0.12,
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: customer.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: ShowContainerWidget(
                                size: size,
                                image: customer[index]['image'],
                                text: customer[index]['text'],
                                press: () {
                                  if (customer[index]['id'] == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlaceRegister()));
                                  } else if (customer[index]['id'] == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManagePlaces()));
                                  } else if (customer[index]['id'] == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Examhistory()));
                                  } else {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => MapTest()));
                                  }
                                },
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    //////
                    Row(
                      children: [
                        Text(
                          'สำหรับสายตรวจ',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Container(
                      height: size.height * 0.12,
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: patrol.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: ShowContainerWidget(
                                size: size,
                                image: patrol[index]['image'],
                                text: patrol[index]['text'],
                                press: () {
                                  if (patrol[index]['id'] == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InspecReport()));
                                  } else if (patrol[index]['id'] == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SetupWorkgroups()));
                                  } else if (patrol[index]['id'] == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Examhistory()));
                                  } else {}
                                },
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    //////
                    Row(
                      children: [
                        Text(
                          'สำหรับเจ้าหน้าที่',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    Container(
                      height: size.height * 0.12,
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: officer.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: ShowContainerWidget(
                                size: size,
                                image: officer[index]['image'],
                                text: officer[index]['text'],
                                press: () {
                                  if (officer[index]['id'] == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NotifyVisitors()));
                                  } else if (officer[index]['id'] == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Examhistory()));
                                  } else if (officer[index]['id'] == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WorkstopPage()));
                                  } else {}
                                },
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
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
