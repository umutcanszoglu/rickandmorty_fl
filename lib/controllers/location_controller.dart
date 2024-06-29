import 'package:get/get.dart';
import 'package:rickandmorty_fl/models/character_model.dart';
import 'package:rickandmorty_fl/models/location_model.dart';
import 'package:rickandmorty_fl/services/rick_and_morty_api.dart';
import 'package:rickandmorty_fl/utils/paginated.dart';

class LocationController extends GetxController {
  late final Paginated<LocationModel> locationPaginated;
  Map<int, List<CharacterModel>> charList = <int, List<CharacterModel>>{}.obs;

  @override
  void onInit() async {
    locationPaginated = Paginated<LocationModel>(
      limit: 20,
      onFetch: (page) async {
        final locations = await RickAndMortyService.getLocations(page);
        if (locations != null) {
          for (final e in locations) {
            getcharbyid(e.id, e.getIds);
          }
        }
        return locations;
      },
    );
    locationPaginated.freshFetch();

    super.onInit();
  }

  Future<void> getcharbyid(int key, List<int> ids) async {
    if (charList.containsKey(key)) return;
    final chars = await RickAndMortyService.getCharactersById(ids) ?? [];
    charList[key] = chars;
  }
}
