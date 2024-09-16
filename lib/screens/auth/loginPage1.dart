import 'package:butlerservice/screens/auth/widgets/button_widget.dart';
import 'package:butlerservice/screens/auth/widgets/globals.dart';

import 'package:butlerservice/screens/auth/widgets/textfield_widget.dart';
import 'package:butlerservice/screens/auth/widgets/wave_widget.dart';
import 'package:butlerservice/screens/home/firstPage.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    //final model = Provider.of<HomeModel>(context);
    return Scaffold(
      backgroundColor: Global.white,
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Container(
              height: size.height - 200,
              color: Global.mediumBlue,
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Global.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      color: Global.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // AppTextForm(
                  //   controller: usernameController,
                  //   labelText: 'ผู้ใช้งาน',
                  //   labelStyle: TextStyle(color: kBlack, fontSize: 25, fontWeight: FontWeight.bold),
                  //   validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกชื่อผู้ใช้งาน' : null,
                  // ),
                  TextFieldWidget(
                    hintText: 'อีเมล',
                    controller: user,
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    //suffixIconData: model.isValid ? Icons.check : null,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextFieldWidget(
                        hintText: 'รหัสผ่าน',
                        controller: pass,
                        obscureText: true,
                        prefixIconData: Icons.lock_outline,
                        //suffixIconData: model.isVisible ? Icons.visibility : Icons.visibility_off,
                        onChanged: (p0) {},
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'ลืมรหัสผ่าน?',
                        style: TextStyle(
                          color: Global.mediumBlue,
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (user.text == 'admin' && pass.text == '12345') {
                        final SharedPreferences prefs = await _prefs;
                        await prefs.setString('user', user.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage()));
                      } else if (user.text == 'customer' && pass.text == '12345') {
                        final SharedPreferences prefs = await _prefs;
                        await prefs.setString('user', user.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage()));
                      } else if (user.text == 'patrol' && pass.text == '12345') {
                        final SharedPreferences prefs = await _prefs;
                        await prefs.setString('user', user.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage()));
                      } else if (user.text == 'officer' && pass.text == '12345') {
                        final SharedPreferences prefs = await _prefs;
                        await prefs.setString('user', user.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage()));
                      }
                    },
                    child: ButtonWidget(
                      title: 'เข้าสู่ระบบ',
                      hasBorder: false,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  // ButtonWidget(
                  //   title: 'Sign Up',
                  //   hasBorder: true,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
