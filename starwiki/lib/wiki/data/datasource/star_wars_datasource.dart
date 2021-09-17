import 'package:starwiki/wiki/data/datasource/i_star_wars_datasource.dart';
import 'package:starwiki/wiki/data/model/people_info_model.dart';

class StarWarsDatasource extends IStarWarsDatasource{
  @override
  Future<PeopleInfoModel> getCharactersFromData() {
    throw UnimplementedError();
  }
}