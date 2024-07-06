import 'package:flutter/material.dart';
import 'package:fyp_language/register_page.dart';

import 'login_page.dart';

class AuthPage extends StatefulWidget {
const AuthPage({Key? key}) : super(key: key);

@override
State<AuthPage> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
// initially, show the login page
bool showLoginPage = true;
void toggleScreen() {
  setState(() {
    showLoginPage= !showLoginPage;
  });
}

  get showRegisterPage => null;

@override
Widget build(BuildContext context) {
if (showLoginPage) {
return LoginPage (showRegisterPage: toggleScreen);
} else {
return RegisterPage(showLoginPage:toggleScreen);
}
}
}

