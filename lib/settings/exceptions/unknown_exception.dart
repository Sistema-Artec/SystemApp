part of 'exceptions.dart';

class UnknownException extends BaseException {
  UnknownException(Object error) : super(message: 'Erro inesperado: $error');
}
