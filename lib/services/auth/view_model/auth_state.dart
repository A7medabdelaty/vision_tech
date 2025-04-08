part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthLoginError extends AuthState {}

final class AuthSignUpLoading extends AuthState {}

final class AuthSignUpSuccess extends AuthState {}

final class AuthSignUpError extends AuthState {}

final class AuthResetPasswordLoading extends AuthState {}

final class AuthResetPasswordSuccess extends AuthState {}

final class AuthResetPasswordError extends AuthState {}
