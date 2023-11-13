import '../../../lib.dart';

class SingelReadController extends GetxController {
  static final instance = Get.find<SingelReadController>();

  //*Read String
  void setString() async {
    final result = await FirestoreRepository();

    if (result != null) {}
  }
}
