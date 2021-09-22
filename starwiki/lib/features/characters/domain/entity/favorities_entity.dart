import 'package:equatable/equatable.dart';

class FavoritiesEntity extends Equatable {
  final String status;
  final String message;

  const FavoritiesEntity({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
