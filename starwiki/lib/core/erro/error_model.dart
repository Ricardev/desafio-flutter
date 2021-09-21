import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String? error;
  final String? erroCode;
  ErrorModel({this.erroCode, this.error});

  @override
  List<Object?> get props => [error, erroCode];
}
