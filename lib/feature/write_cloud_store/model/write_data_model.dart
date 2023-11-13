import '../../../lib.dart';

class WriteDataModel {
  final String? stringField;
  final int? numberField;
  final bool? booleanField;
  final List<String>? arrayField;
  final GeoPoint? geopointField;
  final NestedReadObject? nestedObject;
  final Timestamp? timestampField;
  final ReferenceField? referenceField;
  WriteDataModel({
    this.stringField,
    this.numberField,
    this.booleanField,
    this.arrayField,
    this.geopointField,
    this.nestedObject,
    this.timestampField,
    this.referenceField,
  });

  WriteDataModel copyWith({
    String? stringField,
    int? numberField,
    bool? booleanField,
    List<String>? arrayField,
    GeoPoint? geopointField,
    NestedReadObject? nestedObject,
    Timestamp? timestampField,
    ReferenceField? referenceField,
  }) {
    return WriteDataModel(
      stringField: stringField ?? this.stringField,
      numberField: numberField ?? this.numberField,
      booleanField: booleanField ?? this.booleanField,
      arrayField: arrayField ?? this.arrayField,
      geopointField: geopointField ?? this.geopointField,
      nestedObject: nestedObject ?? this.nestedObject,
      timestampField: timestampField ?? this.timestampField,
      referenceField: referenceField ?? this.referenceField,
    );
  }

// String toJson() => json.encode(toMap()); //create your own json model
  toJson() {
    return {
      'stringField': stringField,
      'numberField': numberField,
      'booleanField': booleanField,
      'arrayField': arrayField,
      'geopointField': geopointField,
      'nestedObject': nestedObject,
      'timestampField': timestampField,
      'referenceField': referenceField,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stringField': stringField,
      'numberField': numberField,
      'booleanField': booleanField,
      'arrayField': arrayField,
      'geopointField': geopointField,
      'nestedObject': nestedObject.toString(),
      'timestampField': timestampField,
      'referenceField': referenceField,
    };
  }

  factory WriteDataModel.fromMap(Map<String, dynamic> map) {
    return WriteDataModel(
      stringField:
          map['stringField'] != null ? map['stringField'] as String : null,
      numberField:
          map['numberField'] != null ? map['numberField'] as int : null,
      booleanField:
          map['booleanField'] != null ? map['booleanField'] as bool : null,
      arrayField: map['arrayField'] != null
          ? List<String>.from((map['arrayField']))
          : null,
      geopointField: map['geopointField'],
      nestedObject:
          NestedReadObject.fromMap(map['nestedObject'] as Map<String, dynamic>),
      timestampField: map['timestampField'],
      referenceField: map['referenceField'],
    );
  }

  factory WriteDataModel.fromJson(String source) =>
      WriteDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReadDataModel(stringField: $stringField, numberField: $numberField, booleanField: $booleanField, arrayField: $arrayField, geopointField: $geopointField, nestedObject: $nestedObject, timestampField: $timestampField, referenceField: $referenceField)';
  }

  @override
  bool operator ==(covariant WriteDataModel other) {
    if (identical(this, other)) return true;

    return other.stringField == stringField &&
        other.numberField == numberField &&
        other.booleanField == booleanField &&
        listEquals(other.arrayField, arrayField) &&
        other.geopointField == geopointField &&
        other.nestedObject == nestedObject &&
        other.timestampField == timestampField &&
        other.referenceField == referenceField;
  }

  @override
  int get hashCode {
    return stringField.hashCode ^
        numberField.hashCode ^
        booleanField.hashCode ^
        arrayField.hashCode ^
        geopointField.hashCode ^
        nestedObject.hashCode ^
        timestampField.hashCode ^
        referenceField.hashCode;
  }
}
