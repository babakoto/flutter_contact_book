import 'dart:convert';

import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data_mocks.dart';

void main() {
  test("Location Model should be subclass of Location Entity", () {
    expect(locationModel, isA<LocationEntity>());
  });

  test("Should return LocationModel", () {
    const locationString = """ 
    {
        "street": {
          "number": 540,
          "name": "Place Paul-Duquaire"
        },
        "city": "Amiens",
        "state": "Haut-Rhin",
        "country": "France",
        "postcode": 70164,
        "coordinates": {
          "latitude": "-74.8124",
          "longitude": "30.9913"
        }
      }
    """;

    final json = jsonDecode(locationString);
    final result = LocationModel.fromJson(json);
    expect(
      result,
      LocationModel(
        street: StreetModel.fromJson(json["street"]),
        city: "Amiens",
        state: "Haut-Rhin",
        country: "France",
        postcode: 70164,
      ),
    );
  });
}
