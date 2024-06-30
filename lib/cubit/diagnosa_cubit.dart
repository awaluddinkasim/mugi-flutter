import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mugi/cubit/diagnosa_state.dart';
import 'package:mugi/models/data_gejala.dart';
import 'package:mugi/shared/services/diagnosa.dart';

FlutterSecureStorage storage = const FlutterSecureStorage();

class DiagnosaCubit extends Cubit<DiagnosaState> {
  final _diagnosaService = DiagnosaService();

  DiagnosaCubit() : super(DiagnosaInitial());

  Future<void> diagnosa(List<DataGejala> data) async {
    emit(DiagnosaLoading());

    try {
      final token = await storage.read(key: 'token');
      if (token != null) {
        final result = await _diagnosaService.diagnosa(
          token: token,
          data: data,
        );

        emit(DiagnosaSuccess(result));
      } else {
        emit(DiagnosaFailed("User tidak terautentikasi"));
      }
    } catch (e) {
      emit(DiagnosaFailed(e.toString()));
    }
  }
}
