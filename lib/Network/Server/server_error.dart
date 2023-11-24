import 'package:dio/dio.dart' hide Headers;
import 'package:get/get.dart';

class ServerError implements Exception {
  int _errorCode = 0;
  String _errorMessage = "";
  DioError _error = DioError(requestOptions: RequestOptions(path: ""));
  ServerError.withError({required DioError error}) {
    _error = error;
    _handleError(error);
  }

  getResponseCode() {
    return _error.response!.statusCode;
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(error) {
    _errorCode = error.response.statusCode;
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        _errorMessage = "Connection timeout".tr;
        break;

      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection".tr;
        break;
      case DioErrorType.badResponse:
        _errorMessage = "Something went wrong".tr;
        break;
      case DioErrorType.badCertificate:
        _errorMessage = "Bad Certificate".tr;
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request".tr;
        break;
    }
    return _errorMessage;
  }
}
