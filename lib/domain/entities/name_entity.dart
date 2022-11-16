part of 'user_entity.dart';

class NameEntity extends Equatable {
  final String title;
  final String first;
  final String last;

  const NameEntity({
    required this.title,
    required this.first,
    required this.last,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['first'] = first;
    map['last'] = last;
    return map;
  }

  @override
  List<Object> get props => [
        title,
        first,
        last,
      ];
}
