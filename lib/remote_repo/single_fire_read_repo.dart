import '../lib.dart';

class SingleFirestoreReadRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _reference =
      _firestore.collection(FirebaseConstant.data);

  static late DocumentSnapshot docSnap;
  static Map<String, dynamic>? snapshot;

  static Future<void> getDocSnap() async {
    docSnap = await _reference.doc('zAVgxfOJCQUNsFY9T7QP').get();
    snapshot = docSnap.data() as Map<String, dynamic>?;
  }

  //* String
  static Future<String?> fetchSingleString() async {
    try {
      if (snapshot != null && snapshot!.containsKey('stringField')) {
        return snapshot!['stringField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  //* Int
  static Future<int?> fetchSingleInt() async {
    try {
      if (snapshot != null && snapshot!.containsKey('numberField')) {
        return snapshot!['numberField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while reading int: $e');
      return null;
    }
  }

  //*BooleanField
  static Future<bool?> fetchSingleBool() async {
    try {
      if (snapshot != null && snapshot!.containsKey('booleanField')) {
        return snapshot!['booleanField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while reading bool: $e');
      return null;
    }
  }

  //*Timestamp
  static Future<Timestamp?> fetchSingleTimestamp() async {
    try {
      if (snapshot != null && snapshot!.containsKey('timestampField')) {
        return snapshot!['timestampField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while reading Timestamp: $e');
      return null;
    }
  }

  //* GeoField
  static Future<GeoPoint?> fetchSingleGeopint() async {
    try {
      if (snapshot != null && snapshot!.containsKey('geopointField')) {
        GeoPoint geoPoint = snapshot!['geopointField'];
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
  static Future<ReferenceField?> fetchSingleReference() async {
    try {
      if (snapshot != null && snapshot!.containsKey('referenceField')) {
        return snapshot!['referenceField'];
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error while Fetching Refernce field $e');
      return null;
    }
  }

  //*Array Field
  static Future<List<String>?> fetchSingleArrayField() async {
    try {
      if (snapshot != null && snapshot!.containsKey('arrayField')) {
        List<String>? newList = [];
        for (var element in snapshot!['arrayField']) {
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
  static Future<ReadNestedModel?> fetchSingleNestedObject() async {
    try {
      if (snapshot != null && snapshot!.containsKey('nestedObject')) {
        debugPrint('Has data : $snapshot');
        return ReadNestedModel.fromMap(snapshot!['nestedObject']);
        
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

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
/// {@endtemplate}
class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}
