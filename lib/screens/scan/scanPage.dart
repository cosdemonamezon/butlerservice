import 'dart:developer';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:butlerservice/constants.dart';
import 'package:butlerservice/model/location.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/screens/scan/recordWork.dart';
import 'package:butlerservice/services/loginService.dart';
import 'package:butlerservice/widget/cupertinoAlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String barcode = "";
  Location? location;

  @override
  void initState() {
    super.initState();
    scan();
  }

  Future scan() async {
    try {
      ScanResult _barcode = await BarcodeScanner.scan();
      setState(() {
        barcode = _barcode.rawContent;
      });

      if (barcode != '') {
        // final _getlocation = await LoginService.scanLocation(barcode);
        // setState(() {
        //   location = _getlocation;
        // });

        if (barcode == '12345') {
          if (!mounted) return;
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWork()));
        } else {
          showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoQuestion(
                    title: 'แจ้งเตือน',
                    content: 'QR Code ไม่ถูกต้อง',
                    press: () {
                      Navigator.pop(context, true);
                    },
                  ));
        }
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => RecordWork(
        //               listlocation: location,
        //             )));
        //inspect(location);
      } else {
        showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoQuestion(
                  title: 'แจ้งเตือน',
                  content: 'QR Code ไม่ถูกต้อง',
                  press: () {
                    Navigator.pop(context, true);
                  },
                ));
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => FirstPage()),
        //     (route) => false);
      }
    } on PlatformException catch (e) {
      inspect(e);
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // The user did not grant the camera permission.
      } else {
        showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoQuestion(
                  title: 'แจ้งเตือน',
                  content: 'มีผิดพลาดกรุณาติดต่อแอดมิน',
                  press: () {
                    Navigator.pop(context, true);
                  },
                ));
        // Unknown error.
      }
    } on FormatException {
      // User returned using the "back"-button before scanning anything.
    } on Exception catch (e) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoQuestion(
                title: 'แจ้งเตือน',
                content: '$e',
                press: () {
                  Navigator.pop(context, true);
                },
              ));
      // Unknown error.
    } catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('scan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Center(
              child: GestureDetector(
                onTap: () {scan();},
                child: Card(
                  color: Colors.amber,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(
                    //   color: Colors.grey,
                    // ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: size.width * 0.30,
                    height: size.height * 0.05,
                    child: Center(
                        child: Text(
                      'SCAN',
                      style: TextStyle(color: kConkgroundColor, fontSize: 16.39, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
