part of 'mixins.dart';

typedef BaseExceptionCallbackHandler = FutureOr<void> Function(
    BaseException exception);

mixin ErrorCallbacksMixin {
  final _errorListeners = <BaseExceptionCallbackHandler>[];

  void addErrorListener(BaseExceptionCallbackHandler listener) {
    _errorListeners.add(listener);
  }

  void removeErrorListener(BaseExceptionCallbackHandler listener) {
    _errorListeners.remove(listener);
  }

  @protected
  void notifyErrorListeners(Object obj) {
    for (final listener in _errorListeners) {
      if (obj is BaseException) {
        listener(obj);
      } else {
        final exception = UnknownException(obj);
        listener(exception);
      }
    }
  }

  void clearListeners() {
    _errorListeners.clear();
  }
}
