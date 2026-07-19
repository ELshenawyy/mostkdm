part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;

  const LoginEvent({required this.phone, required this.password});

  @override
  List<Object> get props => [phone, password];
}

class SignupEvent extends AuthEvent {
  final String name;
  final String phone;
  final String password;

  const SignupEvent(
      {required this.name, required this.phone, required this.password});

  @override
  List<Object> get props => [name, phone, password];
}

class OtpEvent extends AuthEvent {
  final String phone;
  final String otp;

  const OtpEvent({required this.phone, required this.otp});

  @override
  List<Object> get props => [phone, otp];
}
