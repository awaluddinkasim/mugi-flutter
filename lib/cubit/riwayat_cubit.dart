import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mugi/cubit/riwayat_state.dart';
import 'package:mugi/shared/services/riwayat.dart';

FlutterSecureStorage storage = const FlutterSecureStorage();

class RiwayatCubit extends Cubit<RiwayatState> {
  final _riwayatService = RiwayatService();

  RiwayatCubit() : super(RiwayatInitial());

  Future<void> getRiwayat() async {
    emit(RiwayatLoading());

    try {
      final token = await storage.read(key: 'token');

      if (token != null) {
        final result = await _riwayatService.getRiwayat(token: token);

        emit(RiwayatSuccess(result));
      } else {
        emit(RiwayatFailed("User tidak terautentikasi"));
      }
    } catch (e) {
      emit(RiwayatFailed(e.toString()));
    }
  }
}
