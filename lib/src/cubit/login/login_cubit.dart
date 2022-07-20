import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:our_auth/src/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, loginStatus: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, loginStatus: LoginStatus.initial));
  }

  Future<void> loginWithCredentials() async {
    if (state.loginStatus == LoginStatus.submitting) return;
    emit(state.copyWith(loginStatus: LoginStatus.submitting));
    try {
      await _authRepository.loginWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } catch (_) {}
  }
}
