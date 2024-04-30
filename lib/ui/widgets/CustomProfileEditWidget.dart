import 'package:flutter/material.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

import 'custom_text_form_filed.dart';

class CustomProfileEdit extends StatelessWidget {
  String outTitle;
  String inTitle;
  bool isVisible;
  TextEditingController controller;
  String? Function(String?) myValidator;
  Function cancel;
  Function update;


  CustomProfileEdit(
      {required this.outTitle,
      required this.inTitle,
      required this.isVisible,
      required this.controller,
      required this.myValidator,
      required this.cancel,required this.update});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            outTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          CustomTextFormFiled(
            hintText: '',
            controller: controller,
            myValidator: myValidator,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {cancel();}, child: Text('Cancel',style: TextStyle(color: MyTheme.primaryColor))),
              ElevatedButton(onPressed: () {update();}, child: Text('Update',style: TextStyle(color: MyTheme.primaryColor))),
            ],
          )
        ],
      ),
    );
  }
}
