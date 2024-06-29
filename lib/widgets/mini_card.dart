import 'package:flutter/material.dart';
import 'package:rickandmorty_fl/models/character_model.dart';

class MiniCard extends StatelessWidget {
  const MiniCard({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.greenAccent[400],
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(character.image),
            ),
          ),
        ],
      ),
    );
  }
}
