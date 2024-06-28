import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mugi/cubit/auth_state.dart';
import 'package:mugi/models/data_login.dart';
import 'package:mugi/models/user.dart';
import 'package:mugi/shared/services/auth.dart';

FlutterSecureStorage storage = const FlutterSecureStorage();

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthInitial()) {
    checkAuth();
  }

  Future<void> checkAuth() async {
    emit(AuthLoading());

    try {
      final token = await storage.read(key: 'token');

      if (token != null) {
        final result = await _authService.getUser(token: token);

        emit(AuthSuccess(result));
      } else {
        emit(AuthInitial());
        await storage.delete(key: 'token');
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> login(DataLogin data) async {
    emit(AuthLoading());

    try {
      final result = await _authService.login(data);
      await storage.write(key: 'token', value: result.token);

      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> logout() async {
    if (state is AuthSuccess) {
      final currentState = state as AuthSuccess;

      emit(AuthLoading());

      try {
        await _authService.logout(token: currentState.auth.token);
        await storage.delete(key: 'token');

        emit(AuthInitial());
      } catch (e) {
        emit(AuthFailed(e.toString()));
      }
    }
  }

  Future<void> updateUser(User user) async {
    if (state is AuthSuccess) {
      final currentState = state as AuthSuccess;

      emit(AuthLoading());

      try {
        User result = await _authService.updateUser(user);

        emit(UserUpdated(currentState.auth.copyWith(user: result)));
      } catch (e) {
        emit(AuthFailed(e.toString()));

        emit(currentState);
      }
    }
  }
}
