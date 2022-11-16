part of "user_model.dart";

class PictureModel extends PictureEntity {
  const PictureModel({
    required super.large,
    required super.medium,
    required super.thumbnail,
  });

  factory PictureModel.fromJson(dynamic json) {
    return PictureModel(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
