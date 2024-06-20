import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String countryCode;
  final String telephone;
  final String? dateOfBirth;
  final String? gender;
  final String? photoUrl;
  final bool isVerified;
  const UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.countryCode,
    required this.telephone,
    required this.isVerified,
    this.dateOfBirth,
    this.gender,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'countryCode': countryCode,
      'telephone': telephone,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'photoUrl': photoUrl,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      email: map['email'],
      countryCode: map['countryCode'],
      telephone: map['telephone'],
      dateOfBirth: map['dateOfBirth'],
      gender: map['gender'],
      photoUrl: map['photoUrl'],
      isVerified: map['isVerified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String get name => '$firstname $lastname';

  bool get hasCompletedProfile => dateOfBirth != null && gender != null;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      firstname,
      lastname,
      email,
      countryCode,
      telephone,
      dateOfBirth,
      gender,
      photoUrl,
      isVerified,
    ];
  }

  UserModel copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? countryCode,
    String? telephone,
    String? dateOfBirth,
    String? gender,
    String? photoUrl,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      countryCode: countryCode ?? this.countryCode,
      telephone: telephone ?? this.telephone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      photoUrl: photoUrl ?? this.photoUrl,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
