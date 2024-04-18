part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final String email;
  final String password;
  final dynamic apiToken;
  Login({required this.email, required this.password, required this.apiToken});
}