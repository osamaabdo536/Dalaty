import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../widgets/custom_text_form_filed.dart';

class NewPassWordScreen extends StatefulWidget {
  static const String routeName = 'new password page';

  @override
  State<NewPassWordScreen> createState() => _NewPassWordScreenState();
}

class _NewPassWordScreenState extends State<NewPassWordScreen> {
  var passWordController = TextEditingController();

  var confirmationPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  bool isRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      appBar: AppBar(
        title: Text(
          'New password',
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
            Text(
              'Please Enter The New Password For Your account',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/new.png',
              height: 250,
              width: double.infinity,
            ),
            Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomTextFormFiled(
                      hintText: "Enter your Password",
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
                          color: MyTheme.whiteColor,
                        ),
                      ),
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your Password";
                        }
                        bool isValidPassword = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(text);
                        if (!isValidPassword) {
                          return "Please enter valid password";
                        }
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
                          isRePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: MyTheme.whiteColor,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          ChangePassword();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.primaryColor,
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: Text(
                          "Confirm",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyTheme.whiteColor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void ChangePassword() {
    if (formKey.currentState?.validate() == true) {
      //change
    }
  }
}
