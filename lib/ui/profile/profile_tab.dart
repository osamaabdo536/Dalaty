import 'package:flutter/material.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class ProfileTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Text('Welcome,Mostafa',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),
          Text('Mostafa.H@gmail.com',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
