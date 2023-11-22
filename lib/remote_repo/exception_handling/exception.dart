class FirebaseStorageException implements Exception {
  final String message;
  const FirebaseStorageException([
    this.message = 'An unknown error occur',
  ]);
}
