import 'package:equatable/equatable.dart';
import 'package:starwiki/features/characters/domain/entity/character_entity.dart';

class PeopleInfoEntity extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<CharacterEntity> characters;

  const PeopleInfoEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.characters,
  });
  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        characters,
      ];
}
