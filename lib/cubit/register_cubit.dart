import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/register_state.dart';
import 'package:mugi/models/data_register.dart';
import 'package:mugi/shared/services/register.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterService _registerService = RegisterService();

  RegisterCubit() : super(RegisterInitial());

  Future<void> register(DataRegister data) async {
    emit(RegisterLoading());
    try {
      await _registerService.register(data);

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailed(e.toString()));
    }
  }
}
