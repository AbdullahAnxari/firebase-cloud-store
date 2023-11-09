import 'package:read_cloud_store/lib.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReadCloudStore());
  }
}
