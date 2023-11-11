// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NestedObject {
  final String? nestedNumber;
  final String? nestedString;
  NestedObject({
    this.nestedNumber,
    this.nestedString,
  });

  NestedObject copyWith({
    String? nestedNumber,
    String? nestedString,
  }) {
    return NestedObject(
      nestedNumber: nestedNumber ?? this.nestedNumber,
      nestedString: nestedString ?? this.nestedString,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nestedNumber': nestedNumber,
      'nestedString': nestedString,
    };
  }

  factory NestedObject.fromMap(Map<String, dynamic> map) {
    return NestedObject(
      nestedNumber: map['nestedNumber'] != null ? map['nestedNumber'] as String : null,
      nestedString: map['nestedString'] != null ? map['nestedString'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NestedObject.fromJson(String source) => NestedObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NestedObject(nestedNumber: $nestedNumber, nestedString: $nestedString)';

  @override
  bool operator ==(covariant NestedObject other) {
    if (identical(this, other)) return true;
  
    return 
      other.nestedNumber == nestedNumber &&
      other.nestedString == nestedString;
  }

  @override
  int get hashCode => nestedNumber.hashCode ^ nestedString.hashCode;
}
