import 'package:flutter/material.dart';
import 'package:umkm/utils/binding.dart';
import 'package:umkm/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1, milliseconds: 30), () async {
        Navigator.pushReplacementNamed(
            navigatorKey.currentContext!, '/registration');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUI.WHITE,
      body: SafeArea(child: Container()),
    );
  }
}
