part of 'exceptions.dart';

class RequestTimeoutException extends BaseException {
  RequestTimeoutException() : super(message: 'Tempo de conexão expirado');
}
