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

class ForgetPasswordEvent extends AuthEvent {
  final String phone;

  const ForgetPasswordEvent({required this.phone});

  @override
  List<Object> get props => [phone];
}

class ChangePasswordEvent extends AuthEvent {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [oldPassword, newPassword];
}
class ForgotPasswordEvent extends AuthEvent {
  final String phone;
  const ForgotPasswordEvent({required this.phone});

  @override
  List<Object> get props => [phone];
}

class VerifyForgotOtpEvent extends AuthEvent {
  final String phone;
  final String otp;
  const VerifyForgotOtpEvent({required this.phone, required this.otp});

  @override
  List<Object> get props => [phone, otp];
}

class ResendOtpEvent extends AuthEvent {
  final String phone;
  const ResendOtpEvent({required this.phone});

  @override
  List<Object> get props => [phone];
}
class ResetPasswordEvent extends AuthEvent {
  final String phone;
  final String code;
  final String password;

  const ResetPasswordEvent({
    required this.phone,
    required this.code,
    required this.password,
  });

  @override
  List<Object> get props => [phone, code, password];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}
