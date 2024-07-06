import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage(showRegisterPage, {Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // test controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey [300],
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Icon(
                      Icons.android,
                  size: 100,
                  )
                    const SizedBox (height: 75),

                  // Hello again!
                Text(
                'Hello Again!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome back You\’ve been missed!',
              style: TextStyle(
                fontSize: 20,
              ),
                        ),
                  SizedBox(height: 50),

                          // email textfield
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: emailController,
                 decoration: InputDecoration(
                   enabledBorder:
                 border: Colors.grey[200],
                 border: Border.all(color: Colors.white),
                 borderRadius: BorderRadius.circular(12),
                 ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                     decoration: InputDecoration(
                         border: InputBorder.none,
                  hintText: 'Email',
                              ),
                            ),
                ),
                      ),
              ),
                  SizedBox(height: 10),

                  // password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      obscureText: true,
                      controller: passwordController,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // sign in button
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: signIn,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 25),
                      // not a member? register now
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                        'Not a member?',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                        ),
                    ),
              GestureDetector(
                onTap: widget.showRegisterPage ,
                child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
                    ],
                  ),
                ],
                  ),
            ),
    ),
      ),
    );
  }
}

class FirebaseAuth {
}

