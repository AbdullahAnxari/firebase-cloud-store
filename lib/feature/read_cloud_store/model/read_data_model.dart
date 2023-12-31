import '../../../lib.dart';

class ReadDataModel {
  final String? stringField;
  final int? numberField;
  final bool? booleanField;
  final List<String>? arrayField;
  final GeoPoint? geopointField;
  final NestedReadObject? nestedObject;
  final Timestamp? timestampField;
  final ReferenceField? referenceField;
  ReadDataModel({
    this.stringField,
    this.numberField,
    this.booleanField,
    this.arrayField,
    this.geopointField,
    this.nestedObject,
    this.timestampField,
    this.referenceField,
  });

  ReadDataModel copyWith({
    String? stringField,
    int? numberField,
    bool? booleanField,
    List<String>? arrayField,
    GeoPoint? geopointField,
    NestedReadObject? nestedObject,
    Timestamp? timestampField,
    ReferenceField? referenceField,
  }) {
    return ReadDataModel(
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

  factory ReadDataModel.fromMap(Map<String, dynamic> map) {
    return ReadDataModel(
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

  factory ReadDataModel.fromJson(String source) =>
      ReadDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReadDataModel(stringField: $stringField, numberField: $numberField, booleanField: $booleanField, arrayField: $arrayField, geopointField: $geopointField, nestedObject: $nestedObject, timestampField: $timestampField, referenceField: $referenceField)';
  }

  @override
  bool operator ==(covariant ReadDataModel other) {
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
