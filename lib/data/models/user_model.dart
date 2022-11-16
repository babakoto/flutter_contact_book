import 'package:flutter_contact/domain/entities/user_entity.dart';

part 'location_model.dart';
part 'name_model.dart';
part "picture_model.dart";
part "street_model.dart";

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.gender,
    required super.name,
    required super.location,
    required super.email,
    required super.age,
    required super.cell,
    required super.picture,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      id: json["id"]["value"],
      gender: json['gender'],
      name: NameModel.fromJson(json['name']),
      location: LocationModel.fromJson(json['location']),
      email: json['email'],
      age: json['dob']["age"],
      cell: json['cell'],
      picture: PictureModel.fromJson(json['picture']),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['gender'] = gender;
    map['name'] = name.toJson();
    map['location'] = location.toJson();
    map['email'] = email;
    map['age'] = age;
    map['cell'] = cell;
    map['picture'] = picture.toJson();
    return map;
  }
}
