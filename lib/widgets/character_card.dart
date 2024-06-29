import 'package:flutter/material.dart';
import 'package:rickandmorty_fl/models/character_model.dart';
import 'package:rickandmorty_fl/utils/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character, this.ontap});
  final CharacterModel character;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: 160,
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
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Hero(
                tag: character.image,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    character.image,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: FontStyles.myFont.copyWith(fontSize: 24),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(color: Colors.black, thickness: 2, endIndent: 16),
                  Text("Gender : ${character.gender}", style: FontStyles.myFont),
                  const SizedBox(height: 8),
                  Text(
                    "Species : ${character.species}",
                    style: FontStyles.myFont,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Status : ${character.status}",
                    style: FontStyles.myFont,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
