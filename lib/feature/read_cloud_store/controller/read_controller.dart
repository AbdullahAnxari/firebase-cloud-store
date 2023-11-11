import '../../../lib.dart';

class ReadCloudStore extends GetxController {
  static final instance = Get.find<ReadCloudStore>();

  ReadDataModel read = ReadDataModel();

  //* fetch
  void fetchData() async {
    final results = await FirestoreRepository().fetch();

    if (results != null) {
      read = results;
    } else {
      Fluttertoast.showToast(msg: "Fail to fetch data");
    }

    update();
  }

  //* Write
  void setData({required ReadDataModel newData}) async {
    final result = await FirestoreRepository().createData(newData);
    if (result) {
      Fluttertoast.showToast(msg: 'Data is successfully Written');
    } else {
      Fluttertoast.showToast(msg: "Fail to Write data");
    }
  }
}
