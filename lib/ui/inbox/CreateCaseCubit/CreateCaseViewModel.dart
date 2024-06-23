import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/inbox/CreateCaseCubit/CreateCaseStates.dart';

import '../../../api/api_manager.dart';
import '../../utils/image_function.dart';

class CreateCaseViewModel extends Cubit<CreateCaseStates> {
  CreateCaseViewModel() : super(CreateCaseLoadingState());
  DateTime? selectedDate = DateTime.now();
  var fullNameController = TextEditingController(text: 'Ahmed Ahmed');
  var ageController = TextEditingController(text: '20');
  var descriptionController = TextEditingController(text: 'missed missed');
  var mobileNumberController = TextEditingController(text: '01012345678');
  File? pickedImage;
  var selectedCity;
  var selectedGender;
  var selectedStatus = 'missing';
  var selectedlocationOfLoss;
  String? token;
  List<String> cityList = [
    "Alexandria",
    "Aswan",
    "Asyut",
    "Beheira",
    "Beni Suef",
    "Cairo",
    "Dakahlia",
    "Damietta",
    "Fayoum",
    "Gharbia",
    "Giza",
    "Ismailia",
    "Kafr El Sheikh",
    "Luxor",
    "Matrouh",
    "Minya",
    "Monufia",
    "New Valley",
    "North Sinai",
    "Port Said",
    "Qalyubia",
    "Qena",
    "Red Sea",
    "Sharqia",
    "Sohag",
    "South Sinai",
    "Suez",
  ];
  List<String> genderList = ['male', 'female'];
  var formKey = GlobalKey<FormState>();

  void CreateCase() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(CreateCaseLoadingState());
        var response = await ApiManager.CreateCase(
          pickedImage!,
          fullNameController.text,
          selectedGender,
          int.parse(ageController.text),
          mobileNumberController.text,
          selectedCity,
          selectedlocationOfLoss,
          selectedDate.toString(),
          descriptionController.text,
          selectedStatus,
          token!,
        );
        if (response?.success == true) {
          emit(CreateCaseSuccessState(response: response!));
        } else {
          emit(CreateCaseErrorState(errorMessage: response?.message));
        }
      } catch (e) {
        emit(CreateCaseErrorState(errorMessage: e.toString()));
      }
    }
  }

  void showCalendar(BuildContext context) async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 10000)),
        lastDate: DateTime.now());
    if (chosenDate != null) {
      selectedDate = chosenDate;
      print(selectedDate);
    }
  }

  Future<void> pickImageFromCamera() async {
    File? image = await ImageFunction.cameraPicker();
    if (image != null) {
      pickedImage = image;
    }
    print(pickedImage);
  }

  Future<void> pickImageFromGallery() async {
    File? image = await ImageFunction.galleryPicker();
    if (image != null) {
      pickedImage = image;
    }
    print(pickedImage);
  }

  Future<void> getToken(String newtoken) async {
    token = newtoken;
    print(token);
  }
}
