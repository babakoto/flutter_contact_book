import 'package:flutter_contact/data/services/networks/network_service.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkServiceImp implements NetworkService {
  final InternetConnectionCheckerPlus internetService;

  const NetworkServiceImp({
    required this.internetService,
  });

  @override
  Future<bool> get hasConnexion => internetService.hasConnection;
}
