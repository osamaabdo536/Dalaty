import 'package:flutter/material.dart';
import 'package:graduationproject/ui/auth/login/login_screen.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

import '../../components/custom_text_form_filed.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.white,
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: MyTheme.primaryColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomTextFormFiled(
                      hintText: "Full Name",
                      controller: fullNameController,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your full name";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormFiled(
                      hintText: "Phone Number",
                      controller: phoneController,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your phone number";
                        }
                        if (text.length > 11) {
                          return "Please enter correct phone number";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormFiled(
                      hintText: "Enter your Email address",
                      controller: emailController,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your Email Address";
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormFiled(
                      hintText: "Enter your password",
                      controller: passWordController,
                      isVisible: isPassword,
                      keyBordType: TextInputType.number,
                      icon: IconButton(
                        onPressed: () {
                          isPassword = !isPassword;
                          setState(() {});
                        },
                        icon: Icon(
                          isPassword ? Icons.visibility_off : Icons.visibility,
                          color: MyTheme.white,
                        ),
                      ),
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your password";
                        }
                        bool isValidPassword = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(text);
                        if (!isValidPassword) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormFiled(
                      hintText: "Re-Enter your password",
                      controller: confirmationPasswordController,
                      isVisible: isRePassword,
                      keyBordType: TextInputType.number,
                      icon: IconButton(
                        onPressed: () {
                          isRePassword = !isRePassword;
                          setState(() {});
                        },
                        icon: Icon(
                          isRePassword ? Icons.visibility_off : Icons.visibility,
                          color: MyTheme.white,
                        ),
                      ),
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your Password";
                        }
                        if (text != passWordController.text) {
                          return "Your password doesn't match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Register();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.primaryColor,
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: Text(
                          "Sing Up",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyTheme.white,
                                  ),
                        ),
                      ),
                    ),
                    Text(
                      'By clicking  Sign Up , you agree  the terms and conditions',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account ?',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(LoginScreen.routeName);
                          },
                          child: Text(
                            'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void Register() {
    if (formKey.currentState?.validate() == true) {
      //register
    }
  }
}
