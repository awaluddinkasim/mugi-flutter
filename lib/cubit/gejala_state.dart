import 'package:equatable/equatable.dart';
import 'package:mugi/models/gejala.dart';

class GejalaState extends Equatable {
  const GejalaState();

  @override
  List<Object> get props => [];
}

class GejalaInitial extends GejalaState {}

class GejalaLoading extends GejalaState {}

class GejalaSuccess extends GejalaState {
  final List<Gejala> gejala;

  const GejalaSuccess(this.gejala);

  @override
  List<Object> get props => [gejala];
}

class GejalaFailed extends GejalaState {
  final String message;

  const GejalaFailed(this.message);

  @override
  List<Object> get props => [message];
}
