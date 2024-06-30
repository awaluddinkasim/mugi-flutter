import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mugi/cubit/gejala_state.dart';
import 'package:mugi/shared/services/gejala.dart';

FlutterSecureStorage storage = const FlutterSecureStorage();

class GejalaCubit extends Cubit<GejalaState> {
  final _gejalaService = GejalaService();

  GejalaCubit() : super(GejalaInitial());

  Future<void> getGejala() async {
    emit(GejalaLoading());

    try {
      final token = await storage.read(key: 'token');
      if (token != null) {
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
