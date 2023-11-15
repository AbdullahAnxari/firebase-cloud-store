

import '../lib.dart';

class FHelperFunctions{
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}