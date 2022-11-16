import 'dart:convert';

import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data_mocks.dart';

void main() {
  test("Street Model should be subclass of Street Entity", () {
    expect(streetModel, isA<StreetEntity>());
  });

  String streetString = """ 
 {
      "number": 540,
      "name": "Place Paul-Duquaire"
  }
  """;
  test("Should return  StreetModel", () {
    final json = jsonDecode(streetString);
    final result = StreetModel.fromJson(json);
    expect(result, const StreetModel(number: 540, name: "Place Paul-Duquaire"));
  });
}
