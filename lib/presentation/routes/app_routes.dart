import 'package:flutter/cupertino.dart';
import 'package:flutter_contact/presentation/pages/detail/detail_page.dart';
import 'package:flutter_contact/presentation/pages/home/home_page.dart';

enum AppRoutes {
  home(
    path: HomePage.route,
    page: HomePage(),
  ),
  detail(
    path: DetailPage.route,
    page: DetailPage(),
  );

  final String path;
  final Widget page;

  const AppRoutes({required this.path, required this.page});
}
