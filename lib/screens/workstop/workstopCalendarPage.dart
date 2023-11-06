import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/workstop/workstopPage.dart';
import 'package:butlerservice/utils/screen_utils.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class WorkstopCalendarPage extends StatefulWidget {
  const WorkstopCalendarPage({super.key});

  @override
  State<WorkstopCalendarPage> createState() => _WorkstopCalendarPageState();
}

class _WorkstopCalendarPageState extends State<WorkstopCalendarPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kWhite,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('เเจ้งหยุดงาน', style: TextStyle(fontSize: 25, color: kSecondTextColor)),
      ),
      body: Container(
        height: height(context) * 0.8,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Expanded(
              child: MonthView(
                cellAspectRatio: 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height(context) * 0.03),
              child: ButtonBigOnClick(
                size: size,
                press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorkstopPage())),
                buttonName: 'แจ้งหยุดงาน',
                backgroundColor: kBtnMiniColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
