class AppExeptions implements Exception {
  final _message;
  final _prefix;
  AppExeptions([this._message, this._prefix]);

  @override
  String toString() {
    return ('$_message$_prefix');
  }
}

class InternetExceptions extends AppExeptions {
  InternetExceptions([String? message])
      : super(message, 'No Internet Access');
}

class RequestTimeout extends AppExeptions {
  RequestTimeout([String? message]) : super(message, 'Request Timeout');
}

class ServerExceptions extends AppExeptions {
  ServerExceptions([String? message]) : super(message, 'Server Not Found');
}

class InvalidUrlException extends AppExeptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FetchDataException extends AppExeptions {
  FetchDataException([String? message]) : super(message, '');
}
