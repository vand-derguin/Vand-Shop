import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String name;
  final String email;
  final String address;

  AuthAuthenticated({
    required this.name,
    required this.email,
    required this.address,
  });

  @override
  List<Object?> get props => [name, email, address];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthLoggedOut extends AuthState {}
