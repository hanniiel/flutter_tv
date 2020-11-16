import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/repositories/auth/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository _authRepository;

  LoginBloc(AuthRepository authRepository)
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(LoginState.empty());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    } else if (event is ResetPassword) {
      yield* _mapToResetPassword(event.email);
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      {String email, String password}) async* {
    yield LoginState.loading();
    try {
      await _authRepository.signInWithCredentials(
          email: email, password: password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapToResetPassword(String email) async* {
    yield LoginState.loading();
    try {
      await _authRepository.resetPassword(email);
      yield LoginState.reset();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}

//state
class LoginState {
  final bool isSubmitting;
  final bool isReset;
  final bool isSuccess;
  final bool isFailure;

  LoginState({this.isSubmitting, this.isReset, this.isFailure, this.isSuccess});

  factory LoginState.empty() {
    return LoginState(
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
      isReset: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isSubmitting: true,
      isFailure: false,
      isSuccess: false,
      isReset: false,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isReset: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isReset: false,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  factory LoginState.reset() {
    return LoginState(
      isReset: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }
}

///events
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ResetPassword extends LoginEvent {
  final String email;

  const ResetPassword(this.email);

  @override
  List<Object> get props => [email];
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginWithCredentialsPressed({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}
