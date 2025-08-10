import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemed/test/test_screen.dart';


class BottomSheetController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;

  final description = ''.obs;
  final medicines = <Map<String, String>>[].obs;
  final labTests = <Map<String, String>>[].obs;

  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      currentPage.value = 0;
    }
  }

  void addMedicine(String name, String desc, String schedule) {
    medicines.add({'name': name, 'desc': desc, 'schedule': schedule});
  }

  void removeMedicine(int index) => medicines.removeAt(index);

  void addLabTest(String name, String desc) {
    labTests.add({'name': name, 'desc': desc});
  }

  void removeLabTest(int index) => labTests.removeAt(index);

  void submit(BuildContext context) {
    Navigator.of(context).pop();
    Get.to(() => NextScreen());
  }
}