import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/place/detailPlace.dart';
import 'package:flutter/material.dart';

class PlaceRegister extends StatefulWidget {
  const PlaceRegister({super.key});

  @override
  State<PlaceRegister> createState() => _PlaceRegisterState();
}

class _PlaceRegisterState extends State<PlaceRegister> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'ลงทะเบียนสถานที่',
          style: TextStyle(color: kSecondTextColor, fontSize: 24),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/chevron_left.png',
              color: kGrey,
              scale: 1.3,
            )),
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
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0xAA6EB1E6),
              //     offset: Offset(9, 9),
              //     blurRadius: 6,
              //   ),
              // ],
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08, vertical: size.height * 0.02),
              child: Column(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                        iconImage.length,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01,
                                  vertical: size.height * 0.01),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPlace()));
                                    },
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      elevation: 0,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: kPointColor,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        height: size.height * 0.18,
                                        width: size.width * 0.38,
                                        child: Center(
                                            child: Image.asset(
                                                iconImage[index]['icon'])),
                                      ),
                                    ),
                                  ),
                                  Text('${iconImage[index]['text']}'),
                                ],
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
