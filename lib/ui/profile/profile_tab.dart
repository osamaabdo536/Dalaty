import 'package:flutter/material.dart';
import 'package:graduationproject/ui/auth/new_password/new_password_screen.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';
import 'package:graduationproject/ui/widgets/CustomProfileContainer.dart';
import 'package:graduationproject/ui/widgets/CustomProfileEditWidget.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'ProfileTab';

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool nameEdit = false;
  bool passwordEdit = false;
  bool mobileEdit = false;
  bool addressEdit = false;

  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Text(
                'Welcome,Mostafa',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
              Text(
                'Mostafa.H@gmail.com',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
              nameEdit
                  ? CustomProfileEdit(
                      outTitle: 'Your Full Name',
                      inTitle: 'Moustafa Hamed Sayed Ali',
                      isVisible: true,
                      controller: fullNameController,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your full name";
                        }
                        return null;
                      },
                      cancel: () {
                        nameEdit = false;
                        setState(() {});
                      },
                      update: () {},
                    )
                  : CustomProfileContainer(
                      outTitle: 'Your Full Name',
                      inTitle: 'Moustafa Hamed Sayed Ali',
                      isVisible: true,
                      edit: () {
                        nameEdit = true;
                        setState(() {});
                      },
                    ),
              CustomProfileContainer(
                outTitle: 'Your E-mail',
                inTitle: 'Mostafa.H@gmail.com',
                isVisible: false,
                edit: () {},
              ),
              CustomProfileContainer(
                outTitle: 'Your Password',
                inTitle: '*****************',
                isVisible: true,
                edit: () {
                  Navigator.of(context).pushNamed(NewPassWordScreen.routeName);
                },
              ),
              mobileEdit
                  ? CustomProfileEdit(
                      outTitle: 'Your Mobile Number',
                      inTitle: '01069968033',
                      isVisible: true,
                      controller: phoneController,
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your phone number";
                        }
                        if (text.length > 11) {
                          return "Please enter correct phone number";
                        }
                        return null;
                      },
                      cancel: () {
                        mobileEdit = false;
                        setState(() {});
                      },
                      update: () {},
                    )
                  : CustomProfileContainer(
                      outTitle: 'Your Mobile Number',
                      inTitle: '01069968033',
                      edit: () {
                        mobileEdit = true;
                        setState(() {});
                      },
                      isVisible: true,
                    ),
              addressEdit
                  ? CustomProfileEdit(
                      outTitle: 'Your Address',
                      inTitle: 'ALFayoum, Street 15....',
                      isVisible: true,
                      controller: addressController,
                      myValidator: (String) {},
                      cancel: () {
                        addressEdit = false;
                        setState(() {});
                      },
                      update: () {},
                    )
                  : CustomProfileContainer(
                      outTitle: 'Your Address',
                      inTitle: 'ALFayoum, Street 15....',
                      isVisible: true,
                      edit: () {
                        addressEdit = true;
                        setState(() {});
                      },
                    ),
              CustomProfileContainer(
                outTitle: 'National ID',
                inTitle: '3020************',
                isVisible: false,
                edit: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
