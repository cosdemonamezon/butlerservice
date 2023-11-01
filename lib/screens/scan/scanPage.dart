import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/screens/scan/recordWork.dart';
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
        if(!mounted)return;
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecordWork()));
      } else {
        if(!mounted)return;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
      }
      
    } on PlatformException catch (e) {
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
    }on FormatException {
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
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scan'),
      ),
    );
  }
}