part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SignInSuccess extends AuthState {
  final User user;

  SignInSuccess(this.user);
}

class SignInFail extends AuthState {}

class AuthLoading extends AuthState {}
