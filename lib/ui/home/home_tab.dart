import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/widgets/HomeTabItem.dart';

import 'cubit/HomeViewModel.dart';
import 'cubit/Hometates.dart';

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
          } else if (state is HomeErrorState) {
            print(state.errorMessage);
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
          } else if (state is HomeSuccessState) {
            print(state.allMissingList[1].images);

            return Scaffold(
              body: Column(
                children: [

                  SizedBox(
                    height: 60,
                  ),
                  Person(
                    imagePath: 'assets/images/person.jpg',
                    name:state.allMissingList[3].name!,
                    description: 'this is a description',
                    age:state.allMissingList[1].age!,
                    city: 'state',
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}