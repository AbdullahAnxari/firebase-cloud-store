import 'package:fluttertoast/fluttertoast.dart';
import 'package:read_cloud_store/lib.dart';
import 'package:read_cloud_store/remote_repo/single_firebase_repo.dart';

class ReadSingleCloudStore extends GetxController {
  static final instance = Get.find<ReadSingleCloudStore>();

  ReadDataModel readSingle = ReadDataModel();

  void fetchData() async {
    final singleData = await SingleFirestoreRepository().fetchSingleNum();

    if (singleData != null) {
      // readSingle = singleData;
    } else {
      Fluttertoast.showToast(msg: "Failed to fetch data");
    }
    update();
  }
}
