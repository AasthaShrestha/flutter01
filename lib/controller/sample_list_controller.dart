
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleListController extends GetxController{
  var sampleList=[].obs;
  final dataController=TextEditingController();

  insertDataIntoList(String value){
    sampleList.add(value);
  }
  deleteDataFromList(String value){
    sampleList.remove(value);
  }
  ///Handle Add Dialog onPressed
  handleAddDialogPressed(BuildContext dialogContext) {
    if (dataController.text.isNotEmpty) {
      insertDataIntoList(dataController.text);
    }
    dataController.clear();
    Navigator.of(dialogContext).pop();
  }

  ///Handle Delete Dialog onPressed
  handleDeleteDialogPressed(BuildContext dialogContext) {
    if (dataController.text.isNotEmpty) {
      deleteDataFromList(dataController.text);
    }
    dataController.clear();
    Navigator.of(dialogContext).pop();
  }
}