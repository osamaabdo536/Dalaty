import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/home/search_by_name/SearchByName.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';
import 'package:graduationproject/ui/widgets/HomeTabItem.dart';

import 'cubit/HomeStates.dart';
import 'cubit/HomeViewModel.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'HomeTab';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllMissing();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          else if (state is HomeErrorState) {

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage!,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getAllMissing();
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }
          else if (state is HomeSuccessState) {
            return Scaffold(
              backgroundColor: MyTheme.whiteColor,
              body: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                          onPressed: () => showSearch(
                              context: context, delegate: SearchByName()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.primaryColor,
                            side: const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search,color: Colors.white,),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Search',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ))),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Person(
                          missingPersons: state.allMissingList[index],
                          imagePath: state.allMissingList[index].images![0],
                        );
                      },
                      itemCount: state.allMissingList.length,
                    ),
                  ),

                ],
              ),
            );
          }
          return Container();
        });
  }
}