import 'package:flutter/material.dart';
import 'package:graduationproject/ui/auth/new_password/new_password_screen.dart';
import 'package:graduationproject/ui/components/square_text_form_filed.dart';
import '../../utils/app_theme.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = 'reset page';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.white,
      appBar: AppBar(
        title: Text(
          'Reset password',
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            Image.asset('assets/images/reset.png',
              height: 250,
              width: double.infinity,
            ),
            Text('Send the email and a verification code will be sent to your email',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SquareTextFormFiled(),
                  SquareTextFormFiled(),
                  SquareTextFormFiled(),
                  SquareTextFormFiled(),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Login();
                  Navigator.of(context).pushNamed(NewPassWordScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.primaryColor,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                child: Text(
                  "Verify",
                  style:
                  Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
