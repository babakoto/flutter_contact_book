part of "user_model.dart";

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.street,
    required super.city,
    required super.state,
    required super.country,
    required super.postcode,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      street: StreetModel.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
    );
  }
}
