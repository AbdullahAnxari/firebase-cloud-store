import 'dart:developer';
import '../lib.dart';
import 'package:http/http.dart' as http;

//*There are two controller connectivty here

class ConnectivityController extends GetxController {
  static final instance = Get.find<ConnectivityController>();
  bool isOnline = false;
  // late StreamController<bool> _isOnlineController;

  Future<bool> checkConnectivity() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com/'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<void> checkInternet() async {
    bool result = await checkConnectivity();

    isOnline = result;
    if (!isOnline) {
      showDialogBox();
    }
  }

  void close() async {
    Navigator.of(Get.context!).pop(); // Close the dialog
  }
}

//*
class ConnectionServices extends GetxController {
  static final instance = Get.find<ConnectionServices>();
  Connectivity connectivity = Connectivity();

  RxBool isConnected = true.obs;
  StreamSubscription? subscription;

  void listenToNetworkChanges(BuildContext context) {
    subscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        isConnected.value = true;
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        log("Now, connection is on!");
      } else if (connectivityResult == ConnectivityResult.wifi) {
        isConnected.value = true;
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        log("Now, connection is on");
      } else {
        isConnected.value = false;
        CustomBanner.showBanner(
          context,
          "Now, connection is off!",
          Colors.black,
          const Duration(days: 365),
        );
        log("Now, connection is off!");
      }
    });
  }

  @override
  void onClose() {
    subscription!.cancel();
    super.onClose();
  }
}
