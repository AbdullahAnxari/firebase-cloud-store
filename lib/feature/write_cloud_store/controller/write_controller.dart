import '../../../lib.dart';

class WriteCloudStore extends GetxController {
  static final instance = Get.find<WriteCloudStore>();

  ReadDataModel write = ReadDataModel();

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
