import 'package:flutter/material.dart';
import 'package:graduationproject/model/response/Missing.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class Person extends StatelessWidget {
  MissingPersons missingPersons;
  String imagePath;
  Person({
    required this.missingPersons,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    final nameParts = (missingPersons.name ?? '').split(' ');
    final displayName = nameParts.length > 1
        ? '${nameParts[0]} ${nameParts[1]}'
        : missingPersons.name ?? '';
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        margin: EdgeInsets.all(16),
        color: MyTheme.primaryColor,
        child: Row(
          children: [
            Image.network(
              'https://res.cloudinary.com/dvwzzqmpm/image/upload/v1714499957/missingPeople/${imagePath}.jpg',
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              },
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Text(
                    displayName,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.whiteColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: MyTheme.blueColor),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            '${missingPersons.age} y',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: MyTheme.whiteColor),
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyTheme.blueColor),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              missingPersons.gender ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: MyTheme.whiteColor),
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyTheme.blueColor),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              missingPersons.city ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: MyTheme.whiteColor),
                            ),
                          )),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('For Details >>>',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: MyTheme.whiteColor)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
