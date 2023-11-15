// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../lib.dart';

class ReadNestedModel {
  final String nestedString;
  final int nestedNumber;
  ReadNestedModel({
    required this.nestedString,
    required this.nestedNumber,
  });

  ReadNestedModel copyWith({
    String? nestedString,
    int? nestedNumber,
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
      nestedNumber: map['nestedNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadNestedModel.fromJson(String source) => ReadNestedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReadNestedModel(nestedString: $nestedString, nestedNumber: $nestedNumber)';
}
