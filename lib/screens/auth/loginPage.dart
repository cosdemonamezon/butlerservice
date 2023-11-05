import 'package:butlerservice/constants.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(title: const Text('Butler Security Service', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: kBlack))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/icon_app.jpg', height: 150),
            SizedBox(height: size.height * 0.01),
            const Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.03),
            AppTextForm(
              controller: usernameController,
              labelText: 'Username',
              labelStyle: TextStyle(color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
              validator: (val) {
                if (val == null || val.isEmpty) return 'กรุณากรอกชื่อผู้ใช้งาน';
                return null;
              },
            ),
            SizedBox(height: size.height * 0.05),
            AppTextForm(
              controller: passwordController,
              labelText: 'Password',
              labelStyle: TextStyle(color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
              validator: (val) {
                if (val == null || val.isEmpty) return 'กรุณากรอกรหัสผ่าน';
                return null;
              },
            ),
            SizedBox(height: size.height * 0.03),
            ButtonOnClick(
              size: size,
              buttonName: 'ล็อคอิน',
              press: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage())),
            ),
          ],
        ),
      ),
    );
  }
}
