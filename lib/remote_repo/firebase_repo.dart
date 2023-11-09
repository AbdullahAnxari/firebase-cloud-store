import 'remote_repo.dart';

class FirestoreRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ReadDataModel?> fetch() async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.data);
      
      DocumentSnapshot docSnap =
          await reference.doc("zAVgxfOJCQUNsFY9T7QP").get();
      //*
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
}
