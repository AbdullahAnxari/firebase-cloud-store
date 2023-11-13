class ReadReferenceField {
  final String referencePath;

  ReadReferenceField({required this.referencePath});

  factory ReadReferenceField.fromMap(Map<String, dynamic> map) {
    return ReadReferenceField(
      referencePath: map['referencePath'] ?? '',
    );
  }
}