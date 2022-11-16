part of 'user_entity.dart';

class LocationEntity extends Equatable {
  final StreetEntity street;
  final String city;
  final String state;
  final String country;
  final int postcode;

  const LocationEntity({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street.toJson();
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['postcode'] = postcode;
    return map;
  }

  @override
  List<Object> get props => [
        street,
        city,
        state,
        country,
        postcode,
      ];
}
