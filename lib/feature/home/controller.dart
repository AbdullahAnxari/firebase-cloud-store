import '../../lib.dart';

class HomeController extends GetxController {
  static final instance = Get.find<HomeController>();

  late StreamSubscription subscription;
  bool isDeviceConnected = false;

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected) {
            showDialogBox();
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void close() async {
    Get.back();
  }
}
