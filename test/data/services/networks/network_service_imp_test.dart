import 'package:flutter_contact/data/services/networks/network_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';

class MockInternetCheck extends Mock implements InternetConnectionCheckerPlus {}

void main() {
  late MockInternetCheck internetCheck;
  late NetworkServiceImp networkServiceImp;

  setUp(() {
    internetCheck = MockInternetCheck();
    networkServiceImp = NetworkServiceImp(internetService: internetCheck);
  });

  test("Should return true when online", () async {
    when(() => internetCheck.hasConnection).thenAnswer((_) async => true);
    final result = await networkServiceImp.hasConnexion;
    expect(result, true);
  });

  test("Should return false when offline", () async {
    when(() => internetCheck.hasConnection).thenAnswer((_) async => false);
    final result = await networkServiceImp.hasConnexion;
    expect(result, false);
  });
}
