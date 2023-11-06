import 'package:butlerservice/constants.dart';
import 'package:butlerservice/controllers/appController.dart';
import 'package:butlerservice/screens/components/loading_indicator.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:butlerservice/services/loginService.dart';
import 'package:butlerservice/utils/api_exception.dart';
import 'package:butlerservice/widget/AppTextForm.dart';
import 'package:butlerservice/widget/ButtonOnClick.dart';
import 'package:butlerservice/widget/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    LoadingIndicator.open(context);
    if (formKey.currentState!.validate()) {
      try {
        await LoginService.loginUsername(usernameController.text, passwordController.text);
        if (mounted) {
          await context.read<AppController>().initialize();
          mounted ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage())) : null;
        }
      } on ApiException catch (e) {
        mounted ? Dialogs.messageException(context, e) : null;
      } finally {
        LoadingIndicator.close();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(title: const Text('Butler Security Service', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: kBlack))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/icon_app.jpg', height: 150),
              SizedBox(height: size.height * 0.01),
              const Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.03),
              AppTextForm(
                controller: usernameController,
                labelText: 'ผู้ใช้งาน',
                labelStyle: TextStyle(color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
                validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกชื่อผู้ใช้งาน' : null,
              ),
              SizedBox(height: size.height * 0.05),
              AppTextForm(
                controller: passwordController,
                isPassword: true,
                labelText: 'รหัสผ่าน',
                labelStyle: TextStyle(color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
                validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกรหัสผ่าน' : null,
              ),
              SizedBox(height: size.height * 0.03),
              ButtonOnClick(
                size: size,
                buttonName: 'ล็อคอิน',
                press: login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
