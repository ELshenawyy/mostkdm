import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/core/cache/cache_helper.dart';
import 'package:mostkdm/core/network/dio_client.dart';
import 'package:mostkdm/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mostkdm/features/auth/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc()
      : _repository = AuthRepositoryImpl(AuthRemoteDataSourceImpl()),
        super(const AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignupEvent>(_onSignup);
    on<OtpEvent>(_onVerifyOtp);
    on<ChangePasswordEvent>(_onChangePassword);
    on<LogoutEvent>(_onLogout);
    on<ForgotPasswordEvent>(_onForgotPassword);
    on<VerifyForgotOtpEvent>(_onVerifyForgotOtp);
    on<ResendOtpEvent>(_onResendOtp);
    on<ResetPasswordEvent>(_onResetPassword);
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.login(
      phone: event.phone,
      password: event.password,
    );
    await result.fold(
      (error) async => emit(AuthError(error.message)),
      (auth) async {
        await CacheHelper().saveToken(auth.token);
        DioClient().setToken(auth.token);
        emit(const AuthSuccess());
      },
    );
  }

  Future<void> _onSignup(
    SignupEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.signup(
      name: event.name,
      phone: event.phone,
      password: event.password,
    );
    result.fold(
      (error) => emit(AuthError(error.message)),
      (phone) => emit(AuthOtpSent(phone)),
    );
  }

  Future<void> _onVerifyOtp(
    OtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.verifyOtp(
      phone: event.phone,
      otp: event.otp,
    );
    await result.fold(
      (error) async => emit(AuthError(error.message)),
      (token) async {
        await CacheHelper().saveToken(token);
        DioClient().setToken(token);
        emit(const AuthSuccess());
      },
    );
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.changePassword(
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
    );
    result.fold(
      (error) => emit(AuthError(error.message)),
      (_) => emit(const AuthSuccess()),
    );
  }

  Future<void> _onForgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.forgotPassword(phone: event.phone);
    result.fold(
      (error) => emit(AuthError(error.message)),
      (phone) => emit(AuthOtpSent(phone)),
    );
  }

  Future<void> _onVerifyForgotOtp(
    VerifyForgotOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.verifyForgotOtp(
      phone: event.phone,
      otp: event.otp,
    );
    await result.fold(
      (error) async => emit(AuthError(error.message)),
      (token) async {
        await CacheHelper().saveToken(token);
        DioClient().setToken(token);
        emit(const AuthSuccess());
      },
    );
  }

  Future<void> _onResendOtp(
    ResendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.resendOtp(phone: event.phone);
     result.fold(

      (error) => emit(AuthError(error.message)),
      (_) => emit(const AuthSuccess()),);
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.resetPassword(
      phone: event.phone,
      code: event.code,
      password: event.password,
    );
    result.fold(
      (error) => emit(AuthError(error.message)),
      (_) => emit(const AuthSuccess()),
    );
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _repository.logout();
    await result.fold(
      (error) async => emit(AuthError(error.message)),
      (_) async {
        await CacheHelper().deleteToken();
        DioClient().setToken(null);
        emit(const AuthSuccess());
      },
    );
  }
}