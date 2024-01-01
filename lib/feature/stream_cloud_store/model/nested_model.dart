// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../lib.dart';

class StreamNestedModel {
 final String? nestedString;
 final String? nestedNumber;
  StreamNestedModel({
    this.nestedString,
    this.nestedNumber,
  });

  StreamNestedModel copyWith({
    String? nestedString,
    String? nestedNumber,
  }) {
    return StreamNestedModel(
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

  factory StreamNestedModel.fromMap(Map<String, dynamic> map) {
    return StreamNestedModel(
      nestedString: map['nestedString'] != null ? map['nestedString'] as String : null,
      nestedNumber: map['nestedNumber'] != null ? map['nestedNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamNestedModel.fromJson(String source) => StreamNestedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StreamNestedModel(nestedString: $nestedString, nestedNumber: $nestedNumber)';

  @override
  bool operator ==(covariant StreamNestedModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.nestedString == nestedString &&
      other.nestedNumber == nestedNumber;
  }

  @override
  int get hashCode => nestedString.hashCode ^ nestedNumber.hashCode;
}
