import './../../../lib.dart';

class WriteSingleModel {
  String? name;
  int? age;
  bool? isActive;
  Map<String, dynamic>? nestedObject;
  GeoPoint? location;
  List<String>? hobbies;
  DocumentReference? friendReference;
  Timestamp? createdAt;

  WriteSingleModel({
     this.name,
     this.age,
     this.isActive,
     this.nestedObject,
     this.location,
     this.hobbies,
    this.friendReference,
     this.createdAt,
  });

  factory WriteSingleModel.fromSnapshot(DocumentSnapshot snapshot) {
    WriteSingleModel newUser = WriteSingleModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newUser.friendReference = snapshot.reference;
    return newUser;
  }

  factory WriteSingleModel.fromJson(Map<String, dynamic> json) {
    return WriteSingleModel(
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      isActive: json['isActive'] ?? false,
      nestedObject: json['nestedObject'] ?? {},
      location: json['location'] != null
          ? GeoPoint(
              json['location']['latitude'], json['location']['longitude'])
          : GeoPoint(0, 0),
      hobbies: List<String>.from(json['hobbies'] ?? []),
      friendReference: json['friendReference'],
      createdAt: json['createdAt'] != null
          ? Timestamp.fromMicrosecondsSinceEpoch(json['createdAt'])
          : Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'isActive': isActive,
      'nestedObject': nestedObject,
      'location': {
        'latitude': location!.latitude,
        'longitude': location!.longitude
      },
      'hobbies': hobbies,
      'friendReference': friendReference,
      'createdAt': createdAt!.microsecondsSinceEpoch,
    };
  }
}
