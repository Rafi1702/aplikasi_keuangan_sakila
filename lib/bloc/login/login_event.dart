part of 'login_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class Login extends AuthEvent {
  final String email;
  final String password;
  const Login({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
