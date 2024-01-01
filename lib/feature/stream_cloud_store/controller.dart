import '../../lib.dart';

class StreamViewController extends GetxController {
  static final instance = Get.find<StreamViewController>();

  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();

  //*Read
  StreamReadDataModel newModel = StreamReadDataModel();
  bool isLoading = false;

  void listenChanges() {
    isLoading = true;
    update();

    final stream = StreamFireRepo.readCloudStream();
    stream.listen((event) {
      newModel =
          StreamReadDataModel.fromMap(event.data() as Map<String, dynamic>);

      isLoading = false;
      update();
    });
  }

  //*write
  void setCloudFireStream({required StreamReadDataModel data}) async {
    final result = await StreamFireRepo.writeCloudStream(data);
    if (result) {
      Fluttertoast.showToast(msg: "Successfully written data");
    } else {
      Fluttertoast.showToast(msg: "Failed to write data");
    }
  }
}
