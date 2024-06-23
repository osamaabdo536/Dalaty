import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/widgets/search_ai_text.dart';

import '../utils/app_theme.dart';
import '../utils/dialog_utils.dart';
import '../utils/image_function.dart';
import 'cubit/SearchAIStates.dart';
import 'cubit/SearchAIViewModel.dart';

class SearchByAI extends StatefulWidget {
  static const String routeName = 'search by AI';

  @override
  State<SearchByAI> createState() => _SearchByAIState();
}

class _SearchByAIState extends State<SearchByAI> {
  File? pickedImage;
  SearchAIViewModel viewModel = SearchAIViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchAIViewModel, SearchAIStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is SearchAILoadingState) {
            print('loading!!!!!!!!!!!');

            DialogUtils.showLoading(context, 'loading');
          } else if (state is SearchAIErrorState) {
            print('SearchAIErrorState');
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage!,
                posActionName: 'Ok', title: 'Something went wrong !');
            print('${state.errorMessage}');
          } else if (state is SearchAISuccessState) {
            print('SearchAISuccessState');
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context, state.response?.name ?? 'No Data !!',
                posActionName: 'Ok', title: 'Welcome');
            // Navigator.of(context).pushNamed(InboxTab.routeName);
          }
        },
        child: Scaffold(
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
                            height: MediaQuery.of(context).size.width * 0.25,
                          ),
                          Text(
                            'Instructions for high quality',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.055,
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
                          dialog(context);
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: MyTheme.whiteColor,
                                  ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
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
                right: MediaQuery.of(context).size.width * 0.22,
                child: Image.asset(
                  'assets/images/person.png',
                  scale: 1.1,
                ),
              ),
            ],
          ),
        ));
  }

  dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MyTheme.primaryColor,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    File? image = await ImageFunction.cameraPicker();
                    if (image != null) {
                      print('image added successfully');
                      viewModel.SearchByAI(image);
                    }
                  },
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                    color: MyTheme.whiteColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Text(
                  'Camera',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.whiteColor,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    File? image = await ImageFunction.galleryPicker();
                    if (image != null) {
                      print('image added successfully');
                      viewModel.SearchByAI(image);
                    }
                  },
                  icon: Icon(
                    Icons.image_outlined,
                    size: 40,
                    color: MyTheme.whiteColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.whiteColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
