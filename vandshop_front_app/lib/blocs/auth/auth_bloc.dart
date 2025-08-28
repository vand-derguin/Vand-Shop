import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/api_client.dart';
import '../../api/token_storage.dart';

import 'auth_event.dart';
import 'auth_state.dart';

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
      // Call your API login endpoint
      final response = await apiClient.login(event.username, event.password);

      // Save token locally
      await apiClient.tokenStorage.saveToken(response["token"]);

      emit(
        AuthAuthenticated(
          username: response["username"],
          token: response["token"],
        ),
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await apiClient.tokenStorage.clearToken();
    emit(AuthUnauthenticated());
  }
}
