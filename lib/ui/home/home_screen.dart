import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduationproject/ui/home/home_tab.dart';
import 'package:graduationproject/ui/inbox/inbox_tab.dart';
import 'package:graduationproject/ui/profile/profile_tab.dart';
import 'package:graduationproject/ui/search/search_tab.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      bottomNavigationBar: Theme(data: Theme.of(context)!.copyWith(
        canvasColor: MyTheme.primaryColor,
      ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex = index ;
                setState(() {

                });
              },
                items: [
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                          foregroundColor:
                          selectedIndex == 0 ? MyTheme.primaryColor : MyTheme.whiteColor,
                          backgroundColor:
                          selectedIndex == 0 ? MyTheme.whiteColor : Colors.transparent,
                          child: ImageIcon(AssetImage('assets/images/home.png'),
                          )
                      ),
                      label: 'Home'
                  ),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                          foregroundColor:
                          selectedIndex == 1 ? MyTheme.primaryColor : MyTheme.whiteColor,
                          backgroundColor:
                          selectedIndex == 1 ? MyTheme.whiteColor : Colors.transparent,
                          child: ImageIcon(AssetImage('assets/images/search.png'),
                          )
                      ),
                      label: 'Search'
                  ),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                          foregroundColor:
                          selectedIndex == 2 ? MyTheme.primaryColor : MyTheme.whiteColor,
                          backgroundColor:
                          selectedIndex == 2 ? MyTheme.whiteColor : Colors.transparent,
                          child: ImageIcon(AssetImage('assets/images/inbox.png'),
                          )
                      ),
                      label: 'Inbox'
                  ),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                          foregroundColor:
                          selectedIndex == 3 ? MyTheme.primaryColor : MyTheme.whiteColor,
                          backgroundColor:
                          selectedIndex == 3 ? MyTheme.whiteColor : Colors.transparent,
                          child: ImageIcon(AssetImage('assets/images/profile.png'),
                          )
                      ),
                      label: 'Profile'
                  ),
                ],
            ),
          ),
      ),
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs = [
    HomeTab(),SearchTab(),InboxTab(),ProfileTab()
  ];
}
