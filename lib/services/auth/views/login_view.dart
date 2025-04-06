import 'package:flutter/material.dart';
import 'package:vision_tech/services/auth/views/widgets/custom_auth_view.dart';
import 'package:vision_tech/services/auth/views/widgets/login_card.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    List<String> selectedRoles = ['مستخدم عادي', 'مدير', 'مشرف'];

    return CustomAuthView(
      child: CustomLoginCard(
        usernameController: usernameController,
        passwordController: passwordController,
        loginRoles: selectedRoles,
      ),
    );
  }
}
