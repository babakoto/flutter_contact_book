import 'dart:convert';

import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data_mocks.dart';

void main() {
  test("Name Model should be subclass of Name Entity", () {
    expect(nameModel, isA<NameEntity>());
  });

  test("Should return NameModel", () {
    const nameString = """ 
    {
      "title": "Mr",
      "first": "Auguste",
      "last": "Barbier"
    }
    """;

    final json = jsonDecode(nameString);
    final result = NameModel.fromJson(json);
    expect(
      result,
      const NameModel(
        title: "Mr",
        first: "Auguste",
        last: "Barbier",
      ),
    );
  });
}
