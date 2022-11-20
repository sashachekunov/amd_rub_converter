abstract class _Exception implements Exception {
  final String? message;

  const _Exception(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Exception &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class DataBaseException extends _Exception {
  const DataBaseException([String? message]) : super(message);
}

class ServerException extends _Exception {
  const ServerException([String? message]) : super(message);
}

class NetworkException extends _Exception {
  const NetworkException([String? message]) : super(message);
}

class UnauthorisedException extends _Exception {
  const UnauthorisedException([String? message]) : super(message);
}

class ResponseException extends _Exception {
  const ResponseException([String? message]) : super(message);
}
