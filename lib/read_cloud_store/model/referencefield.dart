class ReferenceField {
  final String referencePath;

  ReferenceField({required this.referencePath});

  factory ReferenceField.fromMap(Map<String, dynamic> map) {
    return ReferenceField(
      referencePath: map['referencePath'] ?? '',
    );
  }
}