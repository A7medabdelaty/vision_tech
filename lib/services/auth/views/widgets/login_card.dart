import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/auth/views/forget_password_view.dart';
import 'package:vision_tech/services/auth/views/register_view.dart';
import 'package:vision_tech/services/auth/views/widgets/custom_text_field.dart';
import 'package:vision_tech/services/home/presentation/views/home/home_view.dart';

import '../../view_model/auth_cubit.dart';
import 'custom_auth_button.dart';
import 'login_role_selector.dart';

class CustomLoginCard extends StatelessWidget {
  const CustomLoginCard({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.loginRoles,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final List<String> loginRoles;

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
              'تسجيل الدخول',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              textEditingController: usernameController,
              hintText: 'البريد الإلكتروني',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textEditingController: passwordController,
              hintText: 'كلمة المرور',
              isPasswordField: true,
            ),
            // const SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: const [
            //     Text(':اختر الدور', style: TextStyle(color: Colors.white)),
            //   ],
            // ),
            // const SizedBox(height: 5),
            // LoginRoleSelector(loginRoles: loginRoles),
            const SizedBox(height: 25),
            CustomAuthButton(
              buttonText: 'دخول',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final user = await context.read<AuthCubit>().login(
                    email: usernameController.text,
                    password: passwordController.text,
                  );
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'البريد الإلكتروني أو كلمة السر غير صحيح',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'تم تسجيل الدخول بنجاح',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    Navigator.pushReplacementNamed(context, HomeView.routeName);
                  }
                }
              },
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'نسيت كلمة المرور؟',
                    style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              ForgetPasswordView.routeName,
                            );
                          },
                  ),
                  const TextSpan(
                    text: ' | ',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextSpan(
                    text: 'تسجيل حساب جديد',
                    style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              RegisterView.routeName,
                            );
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
