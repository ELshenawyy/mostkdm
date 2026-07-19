import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignupEvent>(_onSignup);
    on<OtpEvent>(_onVerifyOtp);
  }

    Future<void> _onLogin(
      LoginEvent event,
      Emitter<AuthState> emit,
    ) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));    // Simulate network delay
      emit(AuthSuccess());
    
    }

    Future<void> _onSignup(
      SignupEvent event,
      Emitter<AuthState> emit,
    ) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));    // Simulate network delay
      emit(AuthSuccess());
    }

    Future<void> _onVerifyOtp(
      OtpEvent event,
      Emitter<AuthState> emit,
    ) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));    // Simulate network delay
      emit(AuthSuccess());
    }
  }

