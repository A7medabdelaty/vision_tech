import 'package:flutter/material.dart';
import 'package:vision_tech/services/auth/views/widgets/custom_auth_view.dart';
import 'package:vision_tech/services/auth/views/widgets/foret_password_card.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forgetPasswordView';
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return CustomAuthView(
      child: ForgetPasswordCard(emailController: emailController),
    );
  }
}
