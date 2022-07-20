part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final String name;
  final SignupStatus signupStatus;

  const SignupState({
    required this.email,
    required this.password,
    required this.name,
    required this.signupStatus,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
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
    SignupStatus? signupStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      signupStatus: signupStatus ?? this.signupStatus,
    );
  }
}
