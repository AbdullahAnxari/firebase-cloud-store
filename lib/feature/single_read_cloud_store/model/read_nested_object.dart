// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../lib.dart';

class ReadNestedModel {
  final String nestedString;
  final String nestedNumber;
  ReadNestedModel({
    required this.nestedString,
    required this.nestedNumber,
  });

  ReadNestedModel copyWith({
    String? nestedString,
    String? nestedNumber,
  }) {
    return ReadNestedModel(
      nestedString: nestedString ?? this.nestedString,
      nestedNumber: nestedNumber ?? this.nestedNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nestedString': nestedString,
      'nestedNumber': nestedNumber,
    };
  }

  factory ReadNestedModel.fromMap(Map<String, dynamic> map) {
    return ReadNestedModel(
      nestedString: map['nestedString'] as String,
      nestedNumber: map['nestedNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadNestedModel.fromJson(String source) =>
      ReadNestedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReadNestedModel(nestedString: $nestedString, nestedNumber: $nestedNumber)';

  @override
  bool operator ==(covariant ReadNestedModel other) {
    if (identical(this, other)) return true;

    return other.nestedString == nestedString &&
        other.nestedNumber == nestedNumber;
  }

  @override
  int get hashCode => nestedString.hashCode ^ nestedNumber.hashCode;
}
