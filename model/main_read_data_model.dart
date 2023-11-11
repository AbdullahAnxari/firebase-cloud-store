// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_cloud_store/firebase_cloud_store/firebase_cloud_store.dart';

// class ReadDataModel {
//   final String? name;
//   final int? age;
//   final GeoPoint? currentLocation;
//   // final DegreeModel? degree;
//   final bool? isDeveloper;
//   final List<dynamic>? jobExperience;
//   final DocumentReference<Map<String, dynamic>>? moreDetails;
//   final String? something;
//   final Timestamp? today;

//   ReadDataModel({
//     this.name,
//     this.age,
//     this.currentLocation,
//     this.degree,
//     this.isDeveloper,
//     this.jobExperience,
//     this.moreDetails,
//     this.something,
//     this.today,
//   });

  

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'age': age,
//       'currentLocation': currentLocation,
//       'degree': degree,
//       'isDeveloper': isDeveloper,
//       'jobExperience': jobExperience,
//       'moreDetails': moreDetails,
//       'something': something,
//       'today': today,
//     };
//   }

//   factory ReadDataModel.fromMap(Map<String, dynamic> map) {
//     return ReadDataModel(
//       name: map['name'] as String,
//       today: map['today'],
//       age: map['age'] as int,
//       currentLocation: map['currentLocation'],
//       degree: DegreeModel.fromMap(map['degree'] as Map<String, dynamic>),
//       isDeveloper: map['isDeveloper'] as bool,
//       something: map['something'],
//       jobExperience: List<dynamic>.from((map['jobExperience'])),
//       moreDetails: map['moreDetails'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ReadDataModel.fromJson(String source) =>
//       ReadDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

 
// }
