part of '../../authentication.dart';

abstract class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> login({
    required String email,
    required String password,
  });
}

class LoginCubitImpl extends LoginCubit {
  LoginCubitImpl(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      await _authenticationRepository.login(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
