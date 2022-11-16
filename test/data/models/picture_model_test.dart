import 'dart:convert';

import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data_mocks.dart';

void main() {
  test("Picture Model should be subclass of Picture Entity", () {
    expect(pictureModel, isA<PictureEntity>());
  });

  test("Should return PictureModel", () {
    const pictureString = """ 
   { 
    "large": "https://randomuser.me/api/portraits/men/11.jpg",
    "medium": "https://randomuser.me/api/portraits/med/men/11.jpg",
    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/11.jpg"
    }
    """;

    final json = jsonDecode(pictureString);
    final result = PictureModel.fromJson(json);
    expect(
      result,
      const PictureModel(
        large: "https://randomuser.me/api/portraits/men/11.jpg",
        medium: "https://randomuser.me/api/portraits/med/men/11.jpg",
        thumbnail: "https://randomuser.me/api/portraits/thumb/men/11.jpg",
      ),
    );
  });
}
