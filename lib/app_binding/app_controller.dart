import '../../../lib.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {  
    ///Networking
    Get.put(ConnectionServices());

    ///Controllers
    Get.put(WriteController());
    Get.put(ReadController());
    Get.put(SingleWriteController());
    Get.put(SingleReadController());
    Get.put(HomeConnectivityController());
    Get.put(StreamViewController());
  }
}
