import 'package:flutter/material.dart';

class LoginRoleSelector extends StatelessWidget {
  const LoginRoleSelector({super.key, required this.loginRoles});

  final List<String> loginRoles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: loginRoles.first,
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        underline: const SizedBox(),
        items:
            loginRoles.map((String role) {
              return DropdownMenuItem<String>(value: role, child: Text(role));
            }).toList(),
        onChanged: (String? newValue) {
          // Handle selection change
        },
      ),
    );
  }
}
