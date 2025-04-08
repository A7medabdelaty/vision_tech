import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/auth/views/login_view.dart';

import '../../view_model/auth_cubit.dart';
import 'custom_auth_button.dart';
import 'custom_text_field.dart';

class ForgetPasswordCard extends StatelessWidget {
  const ForgetPasswordCard({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
              'نسيت كلمة المرور',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'أدخل بريدك الإلكتروني لإسترجاع كلمة المرور',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              textEditingController: emailController,
              hintText: 'أدخل بريدك الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 25),
            CustomAuthButton(
              buttonText: 'إرسال رابط إسترجاع كلمة المرور',
              onPressed: () async {
                final isSent = await context.read<AuthCubit>().resetPassword(
                  email: emailController.text.trim(),
                );
                if (isSent) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم إرسال رابط استرجاع كلمة المرور'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'فشل في إرسال الرابط، الرجاء التأكد من صحة البريد الإلكتروني',
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
