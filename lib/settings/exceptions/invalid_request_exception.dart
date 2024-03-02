part of 'exceptions.dart';

class InvalidRequestException extends BaseException {
  InvalidRequestException([String? message])
      : super(message: message ?? 'Requisição inválida');
}
