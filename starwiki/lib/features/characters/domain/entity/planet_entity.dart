import 'package:equatable/equatable.dart';

class PlanetEntity extends Equatable {
  final String planetName;

  const PlanetEntity({
    required this.planetName,
  });
  @override
  List<Object?> get props => [
        planetName,
      ];
}
