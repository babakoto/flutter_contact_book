part of "user_model.dart";

class StreetModel extends StreetEntity {
  const StreetModel({
    required super.number,
    required super.name,
  });

  factory StreetModel.fromJson(Map<String, dynamic> json) {
    return StreetModel(
      number: json['number'],
      name: json['name'],
    );
  }
}
