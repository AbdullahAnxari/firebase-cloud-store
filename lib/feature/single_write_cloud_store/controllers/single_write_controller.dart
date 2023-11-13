import 'package:firebase_cloud_store/remote_repo/single_fire_write_repo.dart';

import './../../../lib.dart';

class SingleWriteController extends GetxController {
  final TextEditingController singleStringController = TextEditingController();
  final TextEditingController singleArrayController = TextEditingController();
  final TextEditingController singleBooleanController = TextEditingController();
  final TextEditingController singelNestedStringController =
      TextEditingController();
  final TextEditingController singleNestedNumberController =
      TextEditingController();
  final TextEditingController singleNestedString2Controller =
      TextEditingController();
  final TextEditingController singleNumberController = TextEditingController();
  final TextEditingController singleReferenceController =
      TextEditingController();
  final TextEditingController singleTimestampController =
      TextEditingController();
  final TextEditingController singleGeoFieldLatitudeController =
      TextEditingController();
  final TextEditingController singleGeoFieldLogitudeController =
      TextEditingController();

  static final instance = Get.find<SingleWriteController>();

  //*String
  void setSingleString({required String stringField}) async {
    final result =
        await SingleFireWriteRepository().creatSingleString(stringField);

    if (result) {
      Fluttertoast.showToast(msg: 'String is successfully Written');
      // return true;
    } else {
      Fluttertoast.showToast(msg: "Fail to Write String");
      // return false;
    }
  }

//* Number
  void setSingleNum({required int numField}) async {
    final result = await SingleFireWriteRepository().creatSingleInt(numField);

    if (result) {
      Fluttertoast.showToast(msg: 'String is successfully Written');
      // return true;
    } else {
      Fluttertoast.showToast(msg: "Fail to Write String");
      // return false;
    }
  }

//* Bool
  void setSingleBool({required bool boolField}) async {
    final result = await SingleFireWriteRepository().creatSinglebool(boolField);
    debugPrint('Bool field$boolField');
    if (result) {
      Fluttertoast.showToast(msg: 'String is successfully Written');
      // return true;
    } else {
      Fluttertoast.showToast(msg: "Fail to Write String");
      // return false;
    }
  }

  //*TimeStamp Field
  void setSingleTimestamp({required Timestamp timestamp}) async {
    final result =
        await SingleFireWriteRepository().createSingleTimeStamp(timestamp);
    if (result) {
      Fluttertoast.showToast(msg: 'String is successfully Written');
      // return true;
    } else {
      Fluttertoast.showToast(msg: "Fail to Write String");
      // return false;
    }
  }

  //*GeoField
  void setSingleGeofield(
      {required double latitude, required double longitude}) async {
    final result = await SingleFireWriteRepository()
        .createSingleGeofield(latitude, longitude);
    if (result) {
      Fluttertoast.showToast(msg: 'String is successfully Written');
    } else {
      Fluttertoast.showToast(msg: "Fail to Write String");
    }
  }

  //*Neseted field
  void setsingleNestedField({required String name, required String age}) async {
    final result =
        await SingleFireWriteRepository().createSingleNestedField(name, age);
    if (result) {
      Fluttertoast.showToast(msg: 'String is successfully Written');
    } else {
      Fluttertoast.showToast(msg: "Fail to Write String");
    }
  }

//*Reference controller
  void setSingleRefenceField({required ReferenceField refName}) async {
    final result =
        await SingleFireWriteRepository().creatSingleReference(refName);
    if (result) {
      Fluttertoast.showToast(msg: 'String is successfully Written');
    } else {
      Fluttertoast.showToast(msg: "Fail to Write String");
    }
  }

  //* Switch
  bool boolValue = false;
  void changeBooloeanValue({required bool value}) {
    boolValue = value;
    singleBooleanController.text = boolValue.toString();
    update();
  }
}
