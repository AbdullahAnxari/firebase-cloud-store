import 'package:firebase_cloud_store/lib.dart';

class SingleFirestoreReadRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _reference =
      _firestore.collection(FirebaseConstant.data);
  //* String
  Future<String?> fetchSingleString() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      //* handles data conversion
      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null && snapshot.containsKey('stringField')) {
        return snapshot['stringField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  //* Int
  Future<int?> fetchSingleInt() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null && snapshot.containsKey('numberField')) {
        return snapshot['numberField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while reading int: $e');
      return null;
    }
  }

  //*BooleanField
  Future<bool?> fetchSingleBool() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null && snapshot.containsKey('booleanField')) {
        return snapshot['booleanField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while reading bool: $e');
      return null;
    }
  }

  //*Timestamp
  Future<Timestamp?> fetchSingleTimestamp() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null && snapshot.containsKey('timestampField')) {
        return snapshot['timestampField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while reading Timestamp: $e');
      return null;
    }
  }

  //* GeoField
  Future<GeoPoint?> fetchSingleGeopint() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;

      if (snapshot != null && snapshot.containsKey('geopointField')) {
        GeoPoint geoPoint = snapshot['geopointField'];
        return geoPoint;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while reading Geopoint $e');
      return null;
    }
  }

  //*ReferenceField
  Future<ReferenceField?> fetchSingleReference() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null && snapshot.containsKey('referenceField')) {
        return snapshot['referenceField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while Fetching Refernce field $e');
      return null;
    }
  }

  //*Array Field
  Future<List<String>?> fetchSingleArrayField() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;
      if (snapshot != null && snapshot.containsKey('arrayField')) {
        List<String>? newList = [];
        for (var element in snapshot['arrayField']) {
          newList.add(element);
        }
        return newList;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while Fetching array field $e');
      return null;
    }
  }

  //*Nested Object
  Future<ReadNestedModel?> fetchSingleNestedObject() async {
    try {
      DocumentSnapshot docSnap =
          await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();

      debugPrint('exist');
      Map<String, dynamic>? snapshot = docSnap.data() as Map<String, dynamic>?;

      if (snapshot != null && snapshot.containsKey('nestedObject')) {
        debugPrint('Has data :');
        return ReadNestedModel.fromMap(snapshot['nestedObject']);
      } else {
        debugPrint('null');
        return null;
      }
    } catch (e) {
      debugPrint('Error while Fetching Nested Object: $e');
      return null;
    }
  }
}
