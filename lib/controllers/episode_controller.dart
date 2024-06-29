import 'package:get/get.dart';
import 'package:rickandmorty_fl/models/episode_model.dart';
import 'package:rickandmorty_fl/services/rick_and_morty_api.dart';
import 'package:rickandmorty_fl/utils/paginated.dart';

class EpisodeController extends GetxController {
  late final Paginated<EpisodeModel> episodePaginated;

  @override
  void onInit() async {
    episodePaginated = Paginated<EpisodeModel>(
      limit: 20,
      onFetch: (page) async {
        return await RickAndMortyService.getEpisode(page);
      },
    );
    episodePaginated.freshFetch();
    super.onInit();
  }
}
