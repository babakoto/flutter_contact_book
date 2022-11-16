part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnFindUsers extends UserEvent {}

class OnFindUserById extends UserEvent {
  final String id;

  @override
  List<Object> get props => [id];

  OnFindUserById({
    required this.id,
  });
}

class OnSortByAge extends UserEvent {
  final bool order;

  @override
  List<Object> get props => [order];

  OnSortByAge({
    required this.order,
  });
}

class OnFindUsersByState extends UserEvent {
  final String state;

  @override
  List<Object> get props => [state];

  OnFindUsersByState({
    required this.state,
  });
}
