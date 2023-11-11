import 'package:firebase_cloud_store/lib.dart';

class SingleFirestoreRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String?> fetchSingleNum(String fieldName) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.data);

      DocumentSnapshot docSnap =
          await reference.doc('zAVgxfOJCQUNsFY9T7QP').get();
      // docSnap = await

      //* handles data conversion
      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null && snapshot.containsKey(fieldName)) {
        return snapshot[fieldName];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
