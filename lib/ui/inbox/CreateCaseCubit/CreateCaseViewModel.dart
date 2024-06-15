import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/inbox/CreateCaseCubit/CreateCaseStates.dart';

import '../../../api/api_manager.dart';
import '../../utils/image_function.dart';

class CreateCaseViewModel extends Cubit<CreateCaseStates> {
  CreateCaseViewModel() : super(CreateCaseLoadingState());

  DateTime? selectedDate = DateTime.now();
  var fullNameController = TextEditingController();
  var ageController = TextEditingController();
  var descriptionController = TextEditingController();
  var statusController = TextEditingController();
  var mobileNumberController = TextEditingController();

  File? pickedImage;
  List<File> images = [];

  var selectedCity;
  var selectedGender;
  var selectedStatus;
  var selectedlocationOfLoss;

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
  List<String> genderList = ['Male', 'Female'];
  List<String> statusList = ['Missing', 'Found'];
  var formKey = GlobalKey<FormState>();

  Future<void> CreateCase() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(CreateCaseLoadingState());
        var request = await ApiManager.CreateCase(
          fullNameController.text,
          selectedGender,
          int.parse(ageController.text),
          mobileNumberController.text,
          selectedCity,
          selectedlocationOfLoss,
          selectedDate.toString(),
          descriptionController.text,
          images,
          selectedStatus,
        );
        if (request.status != "fail") {
          emit(CreateCaseSuccessState());
        } else {
          emit(CreateCaseErrorState(errorMessage: request.message));
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
    }
  }

  Future<void> pickImageFromCamera() async {
    File? image = await ImageFunction.cameraPicker();
    if (image != null) {
      images.add(image);
    }
  }

  Future<void> pickImageFromGallery() async {
    File? image = await ImageFunction.galleryPicker();
    if (image != null) {
      images.add(image);
    }
  }
}
