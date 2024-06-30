import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/auth_cubit.dart';
import 'package:mugi/cubit/auth_state.dart';
import 'package:mugi/cubit/diagnosa_state.dart';
import 'package:mugi/models/data_gejala.dart';
import 'package:mugi/shared/services/diagnosa.dart';

class DiagnosaCubit extends Cubit<DiagnosaState> {
  final _diagnosaService = DiagnosaService();
  final AuthCubit authCubit;
  DiagnosaCubit(this.authCubit) : super(DiagnosaInitial());

  Future<void> diagnosa(List<DataGejala> data) async {
    emit(DiagnosaLoading());

    try {
      final authState = authCubit.state;
      if (authState is AuthSuccess) {
        final token = authState.auth.token;
        final result = await _diagnosaService.diagnosa(token: token, data: data);
        emit(DiagnosaSuccess(result));
      } else {
        emit(DiagnosaFailed("User tidak terautentikasi"));
      }
    } catch (e) {
      emit(DiagnosaFailed(e.toString()));
    }
  }
}
