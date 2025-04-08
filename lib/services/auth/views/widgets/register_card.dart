import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/auth/view_model/auth_cubit.dart';
import 'package:vision_tech/services/auth/views/login_view.dart';
import 'package:vision_tech/services/auth/views/widgets/custom_text_field.dart';

import 'custom_auth_button.dart';

class CustomRegisterCard extends StatelessWidget {
  const CustomRegisterCard({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.anotherPasswordController,
    required this.emailController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController anotherPasswordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF7A5423)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Text(
              'إنشاء حساب جديد',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              textEditingController: usernameController,
              hintText: 'أدخل إسمك الكامل',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textEditingController: emailController,
              hintText: 'أدخل بريدك الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textEditingController: passwordController,
              hintText: 'أدخل كلمة المرور',
              isPasswordField: true,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textEditingController: anotherPasswordController,
              hintText: 'أعد إدخال كلمة المرور',
              isPasswordField: true,
            ),
            const SizedBox(height: 25),
            CustomAuthButton(
              buttonText: 'إنشاء الحساب',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final user = await context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'حدث خطأ أثناء إنشاء الحساب',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'تم إنشاء الحساب بنجاح',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    Navigator.pushNamed(context, LoginView.routeName);
                  }
                }
              },
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: ' هل لديك حساب بالفعل؟ ',
                    style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                  ),
                  TextSpan(
                    text: 'تسجيل الدخول',
                    style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, LoginView.routeName);
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
