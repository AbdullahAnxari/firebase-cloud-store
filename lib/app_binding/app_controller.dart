import '../../../lib.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WriteController());
    Get.put(ReadController());
    Get.put(SingleWriteController());
    Get.put(SingleReadController());
  } 
}
