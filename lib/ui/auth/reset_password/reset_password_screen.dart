import 'package:flutter/material.dart';
import 'package:graduationproject/ui/auth/new_password/new_password_screen.dart';
import 'package:pinput/pinput.dart';

import '../../utils/app_theme.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = 'reset page';
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    String code ;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.whiteColor
      ),
      decoration: BoxDecoration(
        color: MyTheme.primaryColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      appBar: AppBar(
        title: Text(
          'Verification',
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
            Image.asset('assets/images/reset.png',
              height: 250,
              width: double.infinity,
            ),
            Text('Enter the code that has been sent to your email',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Pinput(
              length: 5,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: MyTheme.primaryColor)
                )
              ),
              onChanged: (value){
                code = value ;
                print(code);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
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
                    color: MyTheme.whiteColor,
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
