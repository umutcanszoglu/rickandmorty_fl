import 'package:get/get.dart';
import 'package:rickandmorty_fl/models/character_model.dart';
import 'package:rickandmorty_fl/services/rick_and_morty_api.dart';
import 'package:rickandmorty_fl/utils/paginated.dart';

class CharacterController extends GetxController {
  late final Paginated<CharacterModel> characterPaginated;

  @override
  void onInit() async {
    characterPaginated = Paginated<CharacterModel>(
      limit: 20,
      onFetch: (page) async {
        return await RickAndMortyService.getCharacters(page);
      },
    );
    characterPaginated.freshFetch();
    getCharactersById([1]);
    super.onInit();
  }

  Future<List<CharacterModel>?> getCharactersById(List<int> id) async {
    var chars = await RickAndMortyService.getCharactersById(id);
    for (var element in chars ?? []) {
      print(element.name);
    }
    return chars;
  }
}