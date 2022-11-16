import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contact/core/injections/injections.dart';
import 'package:flutter_contact/domain/usecases/find_users_usecase.dart';
import 'package:flutter_contact/presentation/blocs/user/user_bloc.dart';
import 'package:flutter_contact/presentation/routes/app_routes.dart';
import 'package:flutter_contact/presentation/themes/app_themes.dart';

void main() {
  runApp(
    Injections(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserBloc(findUsersUseCase: context.read<FindUsersUseCase>())
                  ..add(
                    OnFindUsers(),
                  ),
          )
        ],
        child: const FlutterContact(),
      ),
    ),
  );
}

class FlutterContact extends StatelessWidget {
  const FlutterContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themes,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home.path: (context) => AppRoutes.home.page,
        AppRoutes.detail.path: (context) => AppRoutes.detail.page,
      },
    );
  }
}
