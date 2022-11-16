part of 'user_entity.dart';

class PictureEntity extends Equatable {
  final String large;
  final String medium;
  final String thumbnail;

  const PictureEntity({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['large'] = large;
    map['medium'] = medium;
    map['thumbnail'] = thumbnail;
    return map;
  }

  @override
  List<Object> get props => [large, medium, thumbnail];
}
