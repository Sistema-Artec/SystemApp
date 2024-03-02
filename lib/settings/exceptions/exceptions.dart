import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'invalid_request_exception.dart';
part 'request_timeout.dart';
part 'server_exception.dart';
part 'unauthorized_exception.dart';
part 'unknown_exception.dart';

typedef ExceptionObserver = void Function(BaseException exception);

@immutable
abstract class BaseException extends Equatable implements Exception {
  BaseException({required this.message}) {
    for (final ob in observers) {
      ob.call(this);
    }
  }

  final String message;

  static List<ExceptionObserver> observers = [];

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message];
}
