part of 'user_entity.dart';

class StreetEntity extends Equatable {
  final int number;
  final String name;

  const StreetEntity({
    required this.number,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['name'] = name;
    return map;
  }

  @override
  List<Object> get props => [
        number,
        name,
      ];
}
