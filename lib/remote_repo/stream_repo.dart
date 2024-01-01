import 'package:firebase_cloud_store/lib.dart';

class StreamFireRepo {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Stream collectionStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();
  // Stream documentStream =
  //     FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  //*read
  static Stream<DocumentSnapshot> readCloudStream() {
    Stream<DocumentSnapshot> querySnapshot = _firestore
        .collection(FirebaseConstant.data)
        .doc('zAVgxfOJCQUNsFY9T7QP')
        .snapshots(); 
    return querySnapshot;
  }  

  //*Write
  static Future<bool> writeCloudStream(StreamReadDataModel data) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.data);
      await reference.doc('zAVgxfOJCQUNsFY9T7QP')
          .update(data.toMap())
          .then((value) => debugPrint('User Added'))
          .catchError((onError) => debugPrint('Failed to add user: $onError'));
      return true;
    } catch (e) {
      debugPrint('Error while writing:   $e');
      return false;
    }
  }
}
