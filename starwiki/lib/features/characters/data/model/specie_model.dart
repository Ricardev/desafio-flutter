import 'package:starwiki/features/characters/domain/entity/specie_entity.dart';

class SpecieModel extends SpecieEntity {
  const SpecieModel({
    required String specieName,
  }) : super(
          specieName: specieName,
        );

  static dynamic fromJson(Map<String, dynamic> json) {
    return SpecieModel(
      specieName: json['name'],
    );
  }
}
