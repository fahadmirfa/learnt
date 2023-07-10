import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnt/ui/auth/screen.dart';
import 'package:learnt/utils/utils.dart';
import '../../constants.dart';
import '../../widgets/my_password_field.dart';
import '../../widgets/my_text_button.dart';
import '../../widgets/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegExp passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false; // Track loading state

  Future<void> registerButtonPressed() async {
    if (formKey.currentState!.validate()) {
      String name = nameController.text;
      String email = emailController.text;
      String phone = phoneController.text;
      String password = passwordController.text;

      setState(() {
        isLoading = true; // Set loading state to true
      });

      try {
        await _auth
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          // Registration successful, navigate to the login page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInPage(),
            ),
          );
        }).catchError((error) {
          Utils().toastMessage(error.toString());
        });
      } catch (error) {
        // Handle registration errors
        print('Registration error: $error');
        Utils().toastMessage(error.toString());
      }

      setState(() {
        isLoading = false; // Set loading state to false
      });
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
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Register",
                                  style: kHeadline,
                                ),
                                Text(
                                  "Create a new account to get started.",
                                  style: kBodyText2,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                MyTextField(
                                  hintText: 'Name',
                                  inputType: TextInputType.name,
                                  controller: nameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    // Validate name with a regular expression
                                    if (!RegExp(r'^[a-zA-Z\s]+$')
                                        .hasMatch(value)) {
                                      return 'Invalid name format';
                                    }
                                    return null;
                                  },
                                ),
                                MyTextField(
                                  hintText: 'Email',
                                  inputType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    // Validate email with a regular expression
                                    if (!RegExp(
                                        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                        .hasMatch(value)) {
                                      return 'Invalid email format';
                                    }
                                    return null;
                                  },
                                ),
                                MyTextField(
                                  hintText: 'Phone',
                                  inputType: TextInputType.phone,
                                  controller: phoneController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    // Validate phone number with a regular expression
                                    if (!RegExp(
                                      r'^(?:\+?92|0)?[3-9]\d{9}$',
                                      caseSensitive: false,
                                      multiLine: false,
                                    ).hasMatch(value)) {
                                      return 'Invalid phone number format';
                                    }
                                    return null;
                                  },
                                ),
                                MyPasswordField(
                                  isPasswordVisible: passwordVisibility,
                                  onTap: () {
                                    setState(() {
                                      passwordVisibility = !passwordVisibility;
                                    });
                                  },
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a password';
                                    } else if (!passwordRegex.hasMatch(value)) {
                                      return 'Password must contain at least 8 characters including uppercase, lowercase, and numbers.';
                                    }
                                    // You can add more validation logic for password strength
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
                                "Already have an account? ",
                                style: kBodyText,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign-In',
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
                            buttonName: 'Register',
                            onTap: registerButtonPressed,
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
                ),
              ],
            ),
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
