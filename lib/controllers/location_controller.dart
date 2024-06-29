import 'package:get/get.dart';
import 'package:rickandmorty_fl/models/location_model.dart';
import 'package:rickandmorty_fl/services/rick_and_morty_api.dart';
import 'package:rickandmorty_fl/utils/paginated.dart';

class LocationController extends GetxController {
  late final Paginated<LocationModel> locationPaginated;

  @override
  void onInit() async {
    locationPaginated = Paginated<LocationModel>(
      limit: 20,
      onFetch: (page) async {
        return await RickAndMortyService.getLocations(page);
      },
    );
    locationPaginated.freshFetch();
    super.onInit();
  }
}
