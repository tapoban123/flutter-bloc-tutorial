class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._prefix, this._message]);

  @override
  String toString() {
    return "$_message$_prefix"; // Returns the formatted error message.
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
    : super(message, "No Internet Connection.");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
    : super(message, "You don't have access to this feature.");
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message])
    : super(message, "Request Time out.");
}
