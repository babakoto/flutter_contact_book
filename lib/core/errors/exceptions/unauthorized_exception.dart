class UnauthorizedException implements Exception {
  final String? message;
  final int? code;

  const UnauthorizedException({
    this.message,
    this.code,
  });
}
