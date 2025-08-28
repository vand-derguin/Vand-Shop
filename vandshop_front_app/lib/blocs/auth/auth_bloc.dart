import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../api/api_client.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiClient apiClient;

  AuthBloc(this.apiClient) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final data = await apiClient.login(event.email, event.password);

      emit(
        AuthAuthenticated(
          name: data['name'] ?? '',
          email: data['email'] ?? event.email,
          address: data['address'] ?? '',
        ),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) {
    emit(AuthLoggedOut());
  }
}
