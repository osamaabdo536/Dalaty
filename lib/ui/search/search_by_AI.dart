import 'package:flutter/material.dart';
import 'package:graduationproject/ui/widgets/search_ai_text.dart';

import '../utils/app_theme.dart';

class SearchByAI extends StatelessWidget {
  static const String routeName = 'search by AI';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search by AI',
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.39,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height:MediaQuery.of(context).size.width*0.25,
                      ),
                      Text(
                        'Instructions for high quality',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).size.width*0.055,
                      ),
                      SearchAIText(
                          title: 'Good lighting',
                          imagePath: 'assets/images/lamp.png'),
                      SearchAIText(
                          title: 'One person in the photo',
                          imagePath: 'assets/images/man_icon.png'),
                      SearchAIText(
                          title: 'Look directly into the camera',
                          imagePath: 'assets/images/eye.png'),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.primaryColor,
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Take a photo',
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyTheme.whiteColor,
                          ),
                        ),
                        Image.asset('assets/images/camera.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: MediaQuery.of(context).size.width*0.22,
            child: Image.asset('assets/images/person.png',
              scale: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
