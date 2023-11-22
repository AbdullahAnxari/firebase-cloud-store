import 'exception_handling/exception_handling.dart';

import '../../../lib.dart';

class FirestoreRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //* Read data
  Future<ReadDataModel?> fetch() async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.data);
      DocumentSnapshot docSnap =
          await reference.doc("zAVgxfOJCQUNsFY9T7QP").get();

      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null) {
        ReadDataModel read = ReadDataModel.fromMap(snapshot);
        debugPrint("$read");
        return read;
      } else {
        return null;
      }
    } on FirebaseStorageException catch (e) {
      debugPrint("Error: $e");
      return null;
    } on InternetException catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }

  //*Witing data to firestore
  Future<bool> createData(WriteDataModel data) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.writeData);

      await reference.add(data.toMap());
      return true;
    } on FirebaseStorageException catch (e) {
      debugPrint("Error: $e");
      return false;
    } on InternetException catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }
}
