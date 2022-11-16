import 'dart:convert';

import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data_mocks.dart';

void main() {
  test("User Model should subclass of User Entity", () {
    expect(userModel, isA<UserEntity>());
  });

  test("Should return UserModel", () {
    const userString = """ 
{
  "gender": "male",
  "name": {
    "title": "Mr",
    "first": "Auguste",
    "last": "Barbier"
  },
  "location": {
    "street": {
      "number": 540,
      "name": "Place Paul-Duquaire"
    },
    "city": "Amiens",
    "state": "Haut-Rhin",
    "country": "France",
    "postcode": 70164
  },
  "email": "auguste.barbier@example.com",
  "dob": {
    "date": "1965-11-23T00:49:48.067Z",
    "age": 56
  },
  "cell": "06-50-92-32-36",
  "id": {
    "name": "INSEE",
    "value": "1651052127081 69"
  },
  "picture": {
    "large": "https://randomuser.me/api/portraits/men/11.jpg",
    "medium": "https://randomuser.me/api/portraits/med/men/11.jpg",
    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/11.jpg"
  }
}

""";

    final json = jsonDecode(userString);
    final result = UserModel.fromJson(json);
    expect(
      result,
      const UserModel(
        id: "1651052127081 69",
        gender: "male",
        name: NameModel(title: "Mr", first: "Auguste", last: "Barbier"),
        location: LocationModel(
          street: StreetModel(
            number: 540,
            name: "Place Paul-Duquaire",
          ),
          city: "Amiens",
          state: "Haut-Rhin",
          country: "France",
          postcode: 70164,
        ),
        email: "auguste.barbier@example.com",
        age: 56,
        cell: "06-50-92-32-36",
        picture: PictureModel(
          large: "https://randomuser.me/api/portraits/men/11.jpg",
          medium: "https://randomuser.me/api/portraits/med/men/11.jpg",
          thumbnail: "https://randomuser.me/api/portraits/thumb/men/11.jpg",
        ),
      ),
    );
  });
}
