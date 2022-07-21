import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_auth/src/repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit(this._authRepository) : super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, signupStatus: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, signupStatus: SignupStatus.initial));
  }

  Future<void> signupWithCredentials() async {
    if (state.signupStatus == SignupStatus.submitting) return;
    emit(state.copyWith(signupStatus: SignupStatus.submitting));
    try {
      await _authRepository.signup(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(signupStatus: SignupStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          signupStatus: SignupStatus.error,
        ),
      );
    } catch (_) {
      emit(state.copyWith(signupStatus: SignupStatus.error));
    }
  }
}
