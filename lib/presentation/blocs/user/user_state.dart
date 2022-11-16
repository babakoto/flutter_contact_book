part of 'user_bloc.dart';

enum UserStatus { init, loading, failure, success }

extension UserStatusExtension on UserStatus {
  bool get isInit => this == UserStatus.init;

  bool get isLoading => this == UserStatus.loading;

  bool get isFailure => this == UserStatus.failure;

  bool get isSuccess => this == UserStatus.success;
}

class UserState extends Equatable {
  /// FAKE STORAGE
  final List<UserEntity> storage;

  final Failure? failure;
  final List<UserEntity> users;
  final UserEntity? selected;
  final UserStatus status;

  const UserState({
    this.failure,
    this.storage = const [],
    this.users = const [],
    this.selected,
    this.status = UserStatus.init,
  });

  UserState copyWith({
    Failure? failure,
    List<UserEntity>? users,
    List<UserEntity>? storage,
    UserEntity? selected,
    UserStatus? status,
  }) {
    return UserState(
        failure: failure ?? this.failure,
        users: users ?? this.users,
        selected: selected ?? this.selected,
        status: status ?? this.status,
        storage: storage ?? this.storage);
  }

  @override
  List<Object?> get props => [failure, users, selected, status, storage];
}
