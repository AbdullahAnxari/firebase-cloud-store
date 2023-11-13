// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../lib.dart';

class NestedReadObject {
  final String? nestedNumber;
  final String? nestedString;
  NestedReadObject({
    this.nestedNumber,
    this.nestedString,
  });

  NestedReadObject copyWith({
    String? nestedNumber,
    String? nestedString,
  }) {
    return NestedReadObject(
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

  factory NestedReadObject.fromMap(Map<String, dynamic> map) {
    return NestedReadObject(
      nestedNumber: map['nestedNumber'] != null ? map['nestedNumber'] as String : null,
      nestedString: map['nestedString'] != null ? map['nestedString'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NestedReadObject.fromJson(String source) => NestedReadObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NestedObject(nestedNumber: $nestedNumber, nestedString: $nestedString)';

  @override
  bool operator ==(covariant NestedReadObject other) {
    if (identical(this, other)) return true;
  
    return 
      other.nestedNumber == nestedNumber &&
      other.nestedString == nestedString;
  }

  @override
  int get hashCode => nestedNumber.hashCode ^ nestedString.hashCode;
}
