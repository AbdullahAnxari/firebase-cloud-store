class InternetException implements Exception {
  final String message;
  const InternetException([
    this.message = 'No internet available',
  ]);
}
