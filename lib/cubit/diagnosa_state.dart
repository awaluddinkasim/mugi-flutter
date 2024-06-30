import 'package:equatable/equatable.dart';
import 'package:mugi/models/hasil_diagnosa.dart';

class DiagnosaState extends Equatable {
  @override
  List<Object> get props => [];
}

class DiagnosaInitial extends DiagnosaState {}

class DiagnosaLoading extends DiagnosaState {}

class DiagnosaSuccess extends DiagnosaState {
  final HasilDiagnosa data;
  DiagnosaSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class DiagnosaFailed extends DiagnosaState {
  final String message;
  DiagnosaFailed(this.message);
}
