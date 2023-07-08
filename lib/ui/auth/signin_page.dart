import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:learnt/ui/auth/register_page.dart';

import '../../constants.dart';
import '../../widgets/my_password_field.dart';
import '../../widgets/my_text_button.dart';
import '../../widgets/my_text_field.dart';
import '../homescreen.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );

  RegExp passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  );

  void signInButtonPressed() {
    if (_formKey.currentState!.validate()) {
      // Form fields are valid, proceed with sign-in logic
      String email = _emailController.text;
      String password = _passwordController.text;

      // Perform sign-in logic with the obtained values

      // Reset the form fields
      _emailController.clear();
      _passwordController.clear();

      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: 24,
            color: Colors.white,
            image: Svg('assets/images/back_arrow.svg'),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back.",
                              style: kHeadline,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You've been missed!",
                              style: kBodyText2,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            MyTextField(
                              hintText: 'Phone, email or username',
                              inputType: TextInputType.text,
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email or username';
                                } else if (!emailRegex.hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            MyPasswordField(
                              isPasswordVisible: isPasswordVisible,
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (!passwordRegex.hasMatch(value)) {
                                  return 'Password must contain at least 8 characters including uppercase, lowercase, and numbers.';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: kBodyText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextButton(
                        buttonName: 'Sign In',
                        onTap: signInButtonPressed,
                        bgColor: Colors.white,
                        textColor: Colors.black87,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
