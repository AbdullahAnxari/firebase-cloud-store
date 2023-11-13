import 'package:firebase_cloud_store/feature/single_read_cloud_store/controller/single_read_controller.dart';

import '../../../lib.dart';
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WriteController());
    Get.put(ReadController());
    Get.put(SingleWriteController());
    Get.put(SingelReadController());
  }
}
