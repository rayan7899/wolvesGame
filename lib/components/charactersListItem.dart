import 'package:flutter/material.dart';

class CharactersListItem extends StatelessWidget {
  final String characterName;

  CharactersListItem({
    this.characterName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.workspaces_filled,
            size: 200,
          ),
          Text(characterName),
        ],
      ),
    );
  }
}
