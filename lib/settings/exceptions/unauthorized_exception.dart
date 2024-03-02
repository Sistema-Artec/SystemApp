part of 'exceptions.dart';

class UnauthorizedException extends BaseException {
  UnauthorizedException([String? message]) : super(message: message ?? 'Requisição inválida');
}
