import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_fl/controllers/episode_controller.dart';
import 'package:rickandmorty_fl/models/episode_model.dart';
import 'package:rickandmorty_fl/widgets/paginated_list.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EpisodeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: PaginatedList<EpisodeModel>(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        loading: Image.asset("assets/logo.png", width: 100),
        paginated: controller.episodePaginated,
        shrinkWrap: false,
        itemBuilder: (context, idx, item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(item.name),
          );
        },
      ),
    );
  }
}
