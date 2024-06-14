import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduationproject/home_screen.dart';
import 'package:graduationproject/ui/auth/forget_password/forget_password_screen.dart';
import 'package:graduationproject/ui/auth/login/login_screen.dart';
import 'package:graduationproject/ui/auth/new_password/new_password_screen.dart';
import 'package:graduationproject/ui/auth/register/register_screen.dart';
import 'package:graduationproject/ui/auth/reset_password/reset_password_screen.dart';
import 'package:graduationproject/ui/profile/profile_tab.dart';
import 'package:graduationproject/ui/search/search_by_AI.dart';
import 'package:graduationproject/ui/search/search_by_filter.dart';
import 'package:graduationproject/ui/splash/splash_screen.dart';

import 'ui/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SearchByAI.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  ForgetPasswordScreen(),
              ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
              NewPassWordScreen.routeName: (context) => NewPassWordScreen(),
              SearchByFilter.routeName: (context) => SearchByFilter(),
              SearchByAI.routeName: (context) => SearchByAI(),
              ProfileTab.routeName : (context) =>ProfileTab()
            },
            theme: MyTheme.appTheme,
          );
        });
  }
}
