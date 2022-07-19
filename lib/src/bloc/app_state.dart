part of 'app_bloc.dart';

enum UserLoginStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  final UserLoginStatus userLoginStatus;
  final User user;

  const AppState._({
    required this.userLoginStatus,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(
          userLoginStatus: UserLoginStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          userLoginStatus: UserLoginStatus.unauthenticated,
        );

  @override
  List<Object> get props => [userLoginStatus, user];
}
