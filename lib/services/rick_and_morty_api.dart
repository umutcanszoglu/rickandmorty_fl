import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty_fl/models/character_model.dart';
import 'package:rickandmorty_fl/models/episode_model.dart';
import 'package:rickandmorty_fl/models/location_model.dart';

class RickAndMortyService {
  static Dio getDio() {
    return Dio(
      BaseOptions(baseUrl: "https://rickandmortyapi.com/api", responseType: ResponseType.json),
    );
  }

  static Future<List<CharacterModel>?> getCharacters(int page) async {
    try {
      final response = await getDio().get("/character/", queryParameters: {"page": page});
      if (response.statusCode == 200) {
        List<dynamic> items = response.data["results"];
        return items.map((e) => CharacterModel.fromMap(e)).toList();
      }
    } on DioException catch (e) {
      debugPrint("Get Characters  DioError: $e");
    } catch (e) {
      debugPrint("Get Characters  Error: $e");
    }
    return null;
  }

  static Future<List<CharacterModel>?> getCharactersById(List<int> ids) async {
    try {
      final response = await getDio().get("/character/$ids");
      if (response.statusCode == 200) {
        List<dynamic> items = response.data;
        return items.map((e) => CharacterModel.fromMap(e)).toList();
      }
    } on DioException catch (e) {
      debugPrint("Get Characters  DioError: $e");
    } catch (e) {
      debugPrint("Get Characters  Error: $e");
    }
    return null;
  }

  static Future<List<LocationModel>?> getLocations(int page) async {
    try {
      final response = await getDio().get("/location/", queryParameters: {"page": page});
      if (response.statusCode == 200) {
        List<dynamic> items = response.data["results"];
        return items.map((e) => LocationModel.fromMap(e)).toList();
      }
    } on DioException catch (e) {
      debugPrint("Get Location  DioError: $e");
    } catch (e) {
      debugPrint("Get Location  Error: $e");
    }
    return null;
  }

  static Future<List<EpisodeModel>?> getEpisode(int page) async {
    try {
      final response = await getDio().get("/episode/", queryParameters: {"page": page});
      if (response.statusCode == 200) {
        List<dynamic> items = response.data["results"];
        return items.map((e) => EpisodeModel.fromMap(e)).toList();
      }
    } on DioException catch (e) {
      debugPrint("Get Episode  DioError: $e");
    } catch (e) {
      debugPrint("Get Episode  Error: $e");
    }
    return null;
  }
}
