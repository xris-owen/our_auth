part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final String name;
  final String errorMessage;
  final SignupStatus signupStatus;

  const SignupState({
    required this.email,
    required this.password,
    required this.errorMessage,
    required this.name,
    required this.signupStatus,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      errorMessage: '',
      name: '',
      signupStatus: SignupStatus.initial,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        name,
        signupStatus,
      ];

  SignupState copyWith({
    String? email,
    String? password,
    String? name,
    String? errorMessage,
    SignupStatus? signupStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      errorMessage: errorMessage ?? this.errorMessage,
      signupStatus: signupStatus ?? this.signupStatus,
    );
  }
}
