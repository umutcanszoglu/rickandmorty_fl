import 'package:flutter/material.dart';
import 'package:rickandmorty_fl/models/character_model.dart';
import 'package:rickandmorty_fl/models/location_model.dart';
import 'package:rickandmorty_fl/utils/theme.dart';
import 'package:rickandmorty_fl/widgets/mini_card.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.location, this.chars});
  final LocationModel location;
  final List<CharacterModel>? chars;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        gradient: const LinearGradient(
          colors: [
            Color(0xff08b0d4),
            Color(0xffb6dd32),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(location.name, style: FontStyles.myFont.copyWith(fontSize: 20)),
          Text("Dimenson: ${location.dimension}", style: FontStyles.myFont),
          Text("Type: ${location.type}", style: FontStyles.myFont),
          if (chars != null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...chars!.map((e) => MiniCard(character: e)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
