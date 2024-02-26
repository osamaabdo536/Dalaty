import 'package:flutter/material.dart';
import 'package:graduationproject/ui/auth/reset_password/reset_password_screen.dart';

import '../../components/custom_text_form_filed.dart';
import '../../utils/app_theme.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forget page';
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget password',
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
      body: Column(
        children: [
          SizedBox(height: 30,),
          Image.asset('assets/images/forget.png',
            height: 250,
            width: double.infinity,
          ),
          Text('Send the email and a verification code will be sent to your email',
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  CustomTextFormFiled(
                    hintText: "Enter your Email address",
                    controller: emailController,
                    myValidator: (text){
                      if(text == null || text.trim().isEmpty){
                        return "Please enter your Email Address";
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Login();
                        Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.primaryColor,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: Text(
                        "Check email",
                        style:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }

  void Login() {
    if (formKey.currentState?.validate() == true){

    }
  }
}
