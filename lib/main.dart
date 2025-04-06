import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/auth/views/forget_password_view.dart';
import 'package:vision_tech/services/auth/views/login_view.dart';
import 'package:vision_tech/services/auth/views/register_view.dart';
import 'package:vision_tech/services/home/presentation/views/home_view.dart';

void main() {
  runApp(const VisionTechApp());
}

class VisionTechApp extends StatelessWidget {
  const VisionTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:
          (context, child) => MaterialApp(
            routes: {
              LoginView.routeName: (context) => const LoginView(),
              RegisterView.routeName: (context) => const RegisterView(),
              ForgetPasswordView.routeName:
                  (context) => const ForgetPasswordView(),
            },
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          ),
    );
  }
}
