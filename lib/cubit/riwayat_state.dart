import 'package:equatable/equatable.dart';
import 'package:mugi/models/hasil_diagnosa.dart';

class RiwayatState extends Equatable {
  @override
  List<Object> get props => [];
}

class RiwayatInitial extends RiwayatState {}

class RiwayatLoading extends RiwayatState {}

class RiwayatSuccess extends RiwayatState {
  final List<HasilDiagnosa> hasilDiagnosa;

  RiwayatSuccess(this.hasilDiagnosa);

  @override
  List<Object> get props => [hasilDiagnosa];
}

class RiwayatFailed extends RiwayatState {
  final String message;

  RiwayatFailed(this.message);

  @override
  List<Object> get props => [message];
}
