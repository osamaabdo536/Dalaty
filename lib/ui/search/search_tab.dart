import 'package:flutter/material.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.09,
          ),
          Image.asset(
            'assets/images/search_person.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
