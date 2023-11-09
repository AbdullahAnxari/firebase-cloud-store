import 'package:fluttertoast/fluttertoast.dart';
import 'package:read_cloud_store/lib.dart';

class ReadCloudStore extends GetxController {
  static final instance = Get.find<ReadCloudStore>();

  ReadDataModel read = ReadDataModel();

  void fetchData() async {
    final results = await FirestoreRepository().fetch();

    if (results != null) {
      read = results;
    } else {
      Fluttertoast.showToast(msg: "Fail to fetch data");
    }

    update();
  }
}
