
import '../../../lib.dart';

class WriteController extends GetxController {
  final TextEditingController stringController = TextEditingController();
  final TextEditingController arrayController = TextEditingController();
  final TextEditingController booleanController = TextEditingController();
  final TextEditingController nestedString1Controller = TextEditingController();
  final TextEditingController nestedString2Controller = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController timestampController = TextEditingController();
  final TextEditingController geoFieldLatitudeController =
      TextEditingController();
  final TextEditingController geoFieldLogitudeController =   
      TextEditingController();

  static final instance = Get.find<WriteController>();

  WriteDataModel write = WriteDataModel();

  //* Write
  void setData({required WriteDataModel newData}) async {
    final result = await FirestoreRepository().createData(newData);
    if (result) {
      Fluttertoast.showToast(msg: 'Data is successfully Written');
    } else {
      Fluttertoast.showToast(msg: "Fail to Write data");
    }
  }

  //*Switch
  bool boolValue = false;
  void changeBooloeanValue({required bool value}) {
    boolValue = value;
    booleanController.text = boolValue.toString();
    update(); // it will update on UI
  }
}
