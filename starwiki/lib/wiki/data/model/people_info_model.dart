import 'package:starwiki/wiki/data/model/character_model.dart';
import 'package:starwiki/wiki/domain/entity/character_entity.dart';
import 'package:starwiki/wiki/domain/entity/people_info_entity.dart';

class PeopleInfoModel extends PeopleInfoEntity {
  const PeopleInfoModel({
    required int count,
    required String next,
    required String previous,
    required List<CharacterEntity> characters,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          characters: characters,
        );

  factory PeopleInfoModel.fromJson(Map<String, dynamic> json) {
    return PeopleInfoModel(
      count: json['count'],
      next: json['next'] ?? 'last',
      previous: json['previous'] ?? 'first',
      characters: (json['results'] as List)
          .map((dynamic e) => CharacterModel.fromJson(e))
          .toList(),
    );
  }
}
