import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class SearchByFilter extends StatelessWidget {
  static const String routeName = 'search by filter' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search by filter',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 25,
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
      backgroundColor: MyTheme.whiteColor,

    );
  }
}
