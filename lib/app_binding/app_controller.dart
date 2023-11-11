import '../../../lib.dart';
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WriteCloudStore());
  }
}
