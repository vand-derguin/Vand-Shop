import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/api/api_client.dart';
import '../../../core/storage/token_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiClient api;
  AuthBloc(this.api) : super(AuthInitial()) {
    on<AuthLoginRequested>((e, emit) async {
      emit(AuthLoading());
      try {
        final res = await api.dio.post(
          '/auth/login',
          data: {'email': e.email, 'password': e.password},
        );
        await TokenStorage.write(res.data['access_token']);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure('Login failed'));
      }
    });
    on<AuthLogoutRequested>((e, emit) async {
      await TokenStorage.clear();
      emit(AuthInitial());
    });
  }
}
