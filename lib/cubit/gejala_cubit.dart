import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/auth_cubit.dart';
import 'package:mugi/cubit/auth_state.dart';
import 'package:mugi/cubit/gejala_state.dart';
import 'package:mugi/shared/services/gejala.dart';

class GejalaCubit extends Cubit<GejalaState> {
  final _gejalaService = GejalaService();
  final AuthCubit authCubit;

  GejalaCubit(this.authCubit) : super(GejalaInitial());

  Future<void> getGejala() async {
    emit(GejalaLoading());

    try {
      final authState = authCubit.state;

      if (authState is AuthSuccess) {
        final token = authState.auth.token;
        final result = await _gejalaService.getGejala(token: token);

        emit(GejalaSuccess(result));
      } else {
        emit(const GejalaFailed("User tidak terautentikasi"));
      }
    } catch (e) {
      emit(GejalaFailed(e.toString()));
    }
  }
}
