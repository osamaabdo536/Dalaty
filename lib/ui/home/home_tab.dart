import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              body: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        print('sdffffffffffffffe656596esfsdkfmlkfs');
                        return Person(
                          missingPersons: state.allMissingList[index],
                          imagePath: state.allMissingList[14].images?[0],
                        );
                      },
                      itemCount: 10,
                    ),
                   ),
                  // Person(
                  //   imagePath: state.allMissingList[10].images?[0],
                  //   name: state.allMissingList[10].name!,
                  //   age: state.allMissingList[10].age!,
                  //   city: 'state',
                  // ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}
