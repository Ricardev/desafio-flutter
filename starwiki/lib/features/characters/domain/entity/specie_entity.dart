import 'package:equatable/equatable.dart';

class SpecieEntity extends Equatable {
  final String specieName;

  const SpecieEntity({
    required this.specieName,
  });
  @override
  List<Object?> get props => [
        specieName,
      ];
}
