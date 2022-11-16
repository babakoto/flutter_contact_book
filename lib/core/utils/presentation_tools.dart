import 'package:flutter/cupertino.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';

BorderRadius radiusLR(double value) => BorderRadius.only(
      topRight: Radius.circular(value),
      topLeft: Radius.circular(value),
    );

String formatName(NameEntity name) {
  return "${name.title} ${name.first} ${name.last}";
}

String formatLocation(LocationEntity location) {
  return "${location.street.number}  ${location.street.name} ${location.city} ${location.country}";
}
