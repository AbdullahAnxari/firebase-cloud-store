import 'package:read_cloud_store/lib.dart';

class SingleFirestoreRepository {       
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<int?> fetchSingleNum() async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.data);

      DocumentSnapshot docSnap =
          await reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      //* handles data conversion
      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null) {
        return snapshot['numberField'];
      } else {
        return null;  
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
