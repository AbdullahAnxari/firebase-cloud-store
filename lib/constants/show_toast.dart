import '../lib.dart';

void showToast({required String msg}) => Fluttertoast.showToast(
      msg: msg,
      fontSize: 18,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      timeInSecForIosWeb: 2,
      // toastLength: Toast.LENGTH_SHORT,
    );
