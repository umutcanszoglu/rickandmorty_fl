import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_fl/controllers/location_controller.dart';
import 'package:rickandmorty_fl/models/location_model.dart';
import 'package:rickandmorty_fl/widgets/location_card.dart';
import 'package:rickandmorty_fl/widgets/paginated_list.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PaginatedList<LocationModel>(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              loading: Image.asset("assets/logo.png", width: 100),
              paginated: controller.locationPaginated,
              shrinkWrap: false,
              itemBuilder: (context, idx, item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Obx(
                    () => LocationCard(
                      location: item,
                      chars: controller.charList[item.id],
                    ),
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
