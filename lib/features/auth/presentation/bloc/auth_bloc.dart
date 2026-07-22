import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    print('===== LOGIN =====');
    print('phone: "${event.phone}"');
    print('password: "${event.password}"');
    try {
      final auth = await _repository.login(
        phone: event.phone,
        password: event.password,
      );
      print('token before save: ${auth.token}');

      await DioClient().saveToken(auth.token);
      final saved = await DioClient().getToken();
      print('token after save: $saved');

      emit(const AuthSuccess());
    } catch (e) {
      print('error: $e');
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignup(
    SignupEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final phone = await _repository.signup(
        name: event.name,
        phone: event.phone,
        password: event.password,
      );
      emit(AuthOtpSent(phone));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onVerifyOtp(
    OtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final token = await _repository.verifyOtp(
        phone: event.phone,
        otp: event.otp,
      );
      print('token from verifyOtp: $token'); // ← هنا

      await DioClient().saveToken(token);
      final saved = await DioClient().getToken();
      print('token saved: $saved'); // ← هنا
      emit(const AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _repository.changePassword(
        oldPassword: event.oldPassword,
        newPassword: event.newPassword,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onForgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final phone = await _repository.forgotPassword(phone: event.phone);

      emit(AuthOtpSent(phone));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onVerifyForgotOtp(
    VerifyForgotOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final token = await _repository.verifyForgotOtp(
        phone: event.phone,
        otp: event.otp,
      );
      await DioClient().saveToken(token);
    

      emit(const AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onResendOtp(
    ResendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _repository.resendOtp(phone: event.phone);
      emit(const AuthOtpResent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

Future<void> _onResetPassword(
  ResetPasswordEvent event,
  Emitter<AuthState> emit,
) async {
  emit(const AuthLoading());
  try {
     await  _repository.resetPassword(
      phone: event.phone,
      code: event.code,
      password: event.password,
    );
    emit(const AuthSuccess());
  } catch (e) {
        print('reset error: $e');

    emit(AuthError(e.toString()));
  }
}


  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _repository.logout();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
