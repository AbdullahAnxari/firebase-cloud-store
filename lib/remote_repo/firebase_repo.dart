import 'package:firebase_cloud_store/feature/write_cloud_store/model/model.dart';

import '../../../lib.dart';

class FirestoreRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //* Reading data from firestore
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
    } catch (e) {
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
    } catch (e) {
      debugPrint('Create data Error: $e');
      return false;
    }
  }
}
