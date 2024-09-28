import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout. Please try again later.");

      case DioExceptionType.sendTimeout:
        return ServerFailure(
            "Send timeout. Please check your network and try again.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            "Receive timeout. Unable to get a response from the server.");

      case DioExceptionType.badCertificate:
        return ServerFailure(
            "Bad certificate. The server's certificate is not trusted.");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure(
            "Connection error. Please check your internet connection.");

      case DioExceptionType.unknown:
        if (dioError.message!.contains('Socket Exception')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('UnExpected error , please try later');

      default:
        return ServerFailure('Oops, there was an error , try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, try later');
    } else {
      return ServerFailure('Oops, there was an error , try again');
    }
  }
}
