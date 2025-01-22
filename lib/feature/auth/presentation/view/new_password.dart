import 'package:Thimar/feature/auth/presentation/reset_password_body.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordBody(),
    );
  }
}
