import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/auth/views/forget_password_view.dart';
import 'package:vision_tech/services/auth/views/login_view.dart';
import 'package:vision_tech/services/auth/views/register_view.dart';
import 'package:vision_tech/services/home/data/product_model.dart';
import 'package:vision_tech/services/home/presentation/views/home/Category_products_view.dart';
import 'package:vision_tech/services/home/presentation/views/home/home_view.dart';
import 'package:vision_tech/services/home/presentation/views/product_details/product_details_view.dart';
import 'package:vision_tech/services/splash_screen/splash_screen.dart';

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
              HomeView.routeName: (context) => const HomeView(),
              CategoryProductsView.routeName:
                  (context) => CategoryProductsView(),
              ProductDetailsScreen.routeName:
                  (context) => ProductDetailsScreen(
                    product:
                        ModalRoute.of(context)?.settings.arguments as Product,
                  ),
            },
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
    );
  }
}
