part of "user_model.dart";

class NameModel extends NameEntity {
  const NameModel({
    required super.title,
    required super.first,
    required super.last,
  });

  factory NameModel.fromJson(dynamic json) {
    return NameModel(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}
