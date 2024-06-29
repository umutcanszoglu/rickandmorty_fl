import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_fl/controllers/character_controller.dart';
import 'package:rickandmorty_fl/models/character_model.dart';
import 'package:rickandmorty_fl/widgets/character_card.dart';
import 'package:rickandmorty_fl/widgets/paginated_list.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CharacterController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PaginatedList<CharacterModel>(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              loading: Image.asset("assets/logo.png", width: 100),
              paginated: controller.characterPaginated,
              shrinkWrap: false,
              itemBuilder: (context, idx, item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CharacterCard(
                    character: item,
                    ontap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
