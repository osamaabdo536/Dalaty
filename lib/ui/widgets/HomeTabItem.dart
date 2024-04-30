import 'package:flutter/material.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class Person extends StatelessWidget {
  String imagePath;
  String name;
  String description;
  int age;
  String city;
  Person(
      {required this.imagePath,
      required this.name,
      required this.description,
      required this.age,
      required this.city});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        margin: EdgeInsets.all(16),
        color: MyTheme.primaryColor,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(color: Colors.purple,
                  child: Image.asset(imagePath),),
            ),
            Expanded(
              flex:5,
              child: Column(
                children: [
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.whiteColor),
                  ),
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: MyTheme.whiteColor, fontSize: 16),
                  )

                  // ReadMoreText(
                  //   description,
                  //   trimMode: TrimMode.Line,
                  //   trimCollapsedText: 'Show more',
                  //   trimExpandedText: 'Show less',
                  //   trimLines: 10,
                  //
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .titleSmall
                  //       ?.copyWith(color: MyTheme.whiteColor,fontSize: 6),
                  // ),

                  ,
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: MyTheme.blueColor),
                        child: Text(
                          '$age y',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: MyTheme.whiteColor),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyTheme.blueColor),
                          child: Text(
                            city,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: MyTheme.whiteColor),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyTheme.blueColor),
                          child: Text(
                            city,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: MyTheme.whiteColor),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
