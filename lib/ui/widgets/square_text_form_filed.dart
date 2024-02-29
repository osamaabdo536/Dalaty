import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class SquareTextFormFiled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 4,
            ),
          ),
          hintText: "0",
          hintStyle: TextStyle(
            color: MyTheme.whiteColor,
          ),
          filled: true,
          fillColor: Theme.of(context).primaryColor,
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.whiteColor
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
