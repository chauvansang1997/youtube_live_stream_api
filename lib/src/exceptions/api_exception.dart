import 'dart:io';

///Exception from client
class ApiException implements Exception {
  String _message;
  String _prefix;

  ApiException.unableToProcess() {
    _prefix = '';
    _message = "Bad request";
  }

  ApiException.noInternetConnection() {
    _prefix = '';
    _message = "No internet connection";
  }

  ApiException.socketException([SocketException errorCode]) {
    _prefix = '';

    if (errorCode?.osError?.errorCode == 104) {
      _message = 'Cannot connect to server. Code: 104. Message: ${errorCode.osError.message}';
    } else if (errorCode?.osError?.errorCode == 110) {
      _message = "Timeout. Code 110. Message: ${errorCode.osError.message}";
    } else if (errorCode?.osError?.errorCode == 113) {
      _message = "Cannot connect to server. Code 113. Message: ${errorCode.osError.message}";
    } else if (errorCode?.osError?.errorCode == 7) {
      _message = "No internet connection";
    } else {
      _message = 'Unknown error. Code ${errorCode.osError.errorCode}. Message: ${errorCode.osError.message}';
    }
  }

  ApiException.requestTimeout() {
    _message = "Request Timeout";
  }

  ApiException.gatewayTimeOut() {
    _message = "Gateway timeout";
  }

  ApiException.sendTimeout() {
    _message = "Send timeout";
  }

  ApiException.defaultE(String message) {
    _message = message;
  }

  ApiException.serviceUnavailable() {
    _message = "Service unavailable";
  }

  ApiException.requestCancelled() {
    _message = "Request cancelled";
  }

  ApiException.notFound() {
    _message = "Not found";
  }

  @override
  String toString() => '${_prefix ?? ''}$_message';
}
