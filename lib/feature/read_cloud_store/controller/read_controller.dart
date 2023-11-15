import '../../../../../lib.dart';

class ReadController extends GetxController {
  static final instance = Get.find<ReadController>();

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
  void setData({required WriteDataModel newData}) async {
    final result = await FirestoreRepository().createData(newData);
    if (result) {
      Fluttertoast.showToast(msg: 'Data is successfully Written');
    } else {
      Fluttertoast.showToast(msg: "Fail to Write data");
    }
  }
}

// class ReadCloudStore extends GetxController {
//   static final instance = Get.find<ReadCloudStore>();

// }
