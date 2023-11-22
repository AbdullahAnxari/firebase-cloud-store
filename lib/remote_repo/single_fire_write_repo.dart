import '../lib.dart';

//* Write Repositories
class SingleFireWriteRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //*String
  Future<bool> creatSingleString(String stringName) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.singleWriteData);
      await reference.add({'stringField': stringName.toString()});

      return true;
    } catch (e) {
      debugPrint("Error while creating single string: $e");
      return false;
    }
  }

  //*Int
  Future<bool> creatSingleInt(int intNumber) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.singleWriteData);
      await reference.add({'intNumber': intNumber});

      return true;
    } catch (e) {
      debugPrint("Error while creating single string: $e");
      return false;
    }
  }

  //* Bool
  Future<bool> creatSinglebool(bool hasValue) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.singleWriteData);
      await reference.add({'bool': hasValue});

      return true;
    } catch (e) {
      debugPrint("Error while creating single string: $e");
      return false;
    }
  }

  //*Time
  Future<bool> createSingleTimeStamp(Timestamp timestamp) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.singleWriteData);
      await reference.add({'timeStamp': timestamp});

      return true;
    } catch (e) {
      return false;
    }
  }

  //* GeoField
  Future<bool> createSingleGeofield(
      {required double latitude, required double longitude}) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.singleWriteData);
      await reference.add({'Geopoint': GeoPoint(latitude, longitude)});

      return true;
    } catch (e) {
      return false;
    }
  }

  //*Nested String
  Future<bool> createSingleNestedField(String value1, String value2) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.singleWriteData);
      await reference.add({'stringField': value1, 'numberField': value2});

      return true;
    } catch (e) {
      return false;
    }
  }

  //*Reference
  Future<bool> creatSingleReference(ReferenceField refName) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.data);
      await reference.add({
        'reference': refName,
      });
      return true;
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }

  //*List Array
  Future<bool> creatSingleList(List<Map> listName) async {
    try {
      CollectionReference reference =
          _firestore.collection(FirebaseConstant.singleWriteData);
      await reference.add({
        'url': FieldValue.arrayUnion([listName]),
      });
      return true;
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }
}
