abstract class AuthEvent {}

class LoginRequsted extends AuthEvent {
  final String email;
  final String password;

  LoginRequsted({required this.email, required this.password});
}

class LogoutRequested extends AuthEvent {}

class CheckLoginStatus extends AuthEvent {}
