import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contact/data/repositories/user_repository_imp.dart';
import 'package:flutter_contact/data/services/networks/network_service.dart';
import 'package:flutter_contact/data/services/networks/network_service_imp.dart';
import 'package:flutter_contact/data/services/users/user_service.dart';
import 'package:flutter_contact/data/services/users/user_service_imp.dart';
import 'package:flutter_contact/domain/repositories/user_repository.dart';
import 'package:flutter_contact/domain/usecases/find_users_usecase.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Injections extends StatelessWidget {
  final Widget child;
  const Injections({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(
          create: (context) => Dio(),
        ),
        RepositoryProvider<InternetConnectionCheckerPlus>(
          create: (context) => InternetConnectionCheckerPlus(),
        ),
        RepositoryProvider<NetworkService>(
          create: (context) => NetworkServiceImp(
            internetService: context.read<InternetConnectionCheckerPlus>(),
          ),
        ),
        RepositoryProvider<UserService>(
          create: (context) => UserServiceImp(
              networkService: context.read<NetworkService>(),
              client: context.read<Dio>()),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImp(
            userService: context.read<UserService>(),
          ),
        ),
        RepositoryProvider<FindUsersUseCase>(
            create: (context) => FindUsersUseCase(
                userRepository: context.read<UserRepository>())),
      ],
      child: child,
    );
  }
}
