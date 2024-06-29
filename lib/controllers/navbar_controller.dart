import 'package:get/get.dart';
import 'package:rickandmorty_fl/screens/character_list_page.dart';
import 'package:rickandmorty_fl/screens/episode_page.dart';
import 'package:rickandmorty_fl/screens/location_page.dart';

class NavbarController extends GetxController {
  final currentPage = 0.obs;

  final pages = [const CharacterListPage(), const EpisodePage(), const LocationPage()];
}
