import 'package:equatable/equatable.dart';

part 'locatin_entity.dart';
part 'name_entity.dart';
part 'picture_entity.dart';
part 'street_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String gender;
  final NameEntity name;
  final LocationEntity location;
  final String email;
  final int age;
  final String cell;
  final PictureEntity picture;

  const UserEntity({
    required this.id,
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.age,
    required this.cell,
    required this.picture,
  });

  @override
  List<Object> get props => [
        id,
        gender,
        name,
        location,
        email,
        age,
        cell,
        picture,
      ];
}
