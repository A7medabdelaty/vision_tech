import 'package:flutter/material.dart';
import 'package:vision_tech/services/auth/views/widgets/custom_auth_view.dart';
import 'package:vision_tech/services/auth/views/widgets/register_card.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'registerView';
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController anotherPasswordController =
        TextEditingController();
    final TextEditingController emailController = TextEditingController();
    return CustomAuthView(
      child: CustomRegisterCard(
        usernameController: usernameController,
        passwordController: passwordController,
        emailController: emailController,
        anotherPasswordController: anotherPasswordController,
      ),
    );
  }
}
