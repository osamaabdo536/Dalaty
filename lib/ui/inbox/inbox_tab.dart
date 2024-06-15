import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import '../widgets/custom_elevated_button.dart';
import 'CreateCaseScreen.dart';

class InboxTab extends StatelessWidget {
  static const String routeName = 'inbox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.14,),
          Container(
            color: MyTheme.blueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Create Case',textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.whiteColor)),
                SizedBox(height: 12,),
                Text('Create a case in case you lost a person.'
                    ' Your case will be reviewed and activated as soon as possible',textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: MyTheme.whiteColor)),
                CustomElevatedButton(title: 'Create', imagePath: 'assets/images/man_icon.png', routeName: CreateCaseScreen.routeName)
              ],
            ),
          )
        ],
      ),
    );
  }
}
