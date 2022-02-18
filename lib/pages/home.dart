import 'package:flutter/material.dart';
import 'package:wolfs/components/changeCharacterTime.dart';
import 'package:wolfs/components/charactersListItem.dart';
import 'package:wolfs/components/startButton.dart';
import 'package:wolfs/main.dart';
import 'package:wolfs/models/character.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          StartButton(),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blueGrey[800],
                    color: Colors.accents[4],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        for (int i = 0; i < characters.length; i++)
                          ChanageCharacterTime(characters[i]),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
