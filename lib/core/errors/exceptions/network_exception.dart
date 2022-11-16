class NetworkException implements Exception {
  final String? message;

  NetworkException({
    this.message = "You are offline",
  });
}
