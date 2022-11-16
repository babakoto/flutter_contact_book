import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_contact/core/utils/fos/failure.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_contact/domain/usecases/find_users_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FindUsersUseCase findUsersUseCase;

  UserBloc({required this.findUsersUseCase}) : super(const UserState()) {
    on<OnFindUsers>(_onFindUsers);
    on<OnFindUserById>(_onFindUserById);
    on<OnSortByAge>(_onSortByAge);
    on<OnFindUsersByState>(
      _onFindUserByState,
      transformer: _debounceSequential(
        const Duration(milliseconds: 500),
      ),
    );
  }

  EventTransformer<Event> _debounceSequential<Event>(Duration duration) {
    return (events, mapper) =>
        events.debounceTime(duration).asyncExpand(mapper);
  }

  FutureOr<void> _onFindUsers(
      OnFindUsers event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    final result = await findUsersUseCase();

    result.on((failure) {
      emit(state.copyWith(
        status: UserStatus.failure,
        failure: failure,
      ));
    }, (success) {
      success.sort((a, b) => a.age.compareTo(b.age));
      emit(state.copyWith(
        status: UserStatus.success,
        storage: success,
        failure: null,
        users: success,
      ));
    });
  }

  FutureOr<void> _onFindUserById(
      OnFindUserById event, Emitter<UserState> emit) async {
    List<UserEntity> users = state.users;
    final user = users.firstWhere((user) => user.id == event.id);
    emit(state.copyWith(status: UserStatus.success, selected: user));
  }

  FutureOr<void> _onSortByAge(OnSortByAge event, Emitter<UserState> emit) {
    emit(state.copyWith(status: UserStatus.loading));
    emit(
      state.copyWith(
        users: state.users.reversed.toList(),
        status: UserStatus.success,
      ),
    );
  }

  FutureOr<void> _onFindUserByState(
      OnFindUsersByState event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));

    List<UserEntity> users = state.storage;
    emit(
      state.copyWith(
        users: users.where(
          (user) {
            return user.location.state.toLowerCase().contains(
                  event.state.toLowerCase(),
                );
          },
        ).toList(),
        status: UserStatus.success,
      ),
    );
  }
}
