import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/notifications.dart';
import 'package:flutter/material.dart';
import 'package:wolfs/main.dart';
import 'package:wolfs/models/character.dart';

class StartButton extends StatefulWidget {
  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final player = AudioCache();
  bool isRun = false;
  AudioPlayer backgraoundController, forgraound;
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRun ? stopGame() : startGame();
          isRun = !isRun;
        });
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 250,
            width: 250,
            child: CircularProgressIndicator(
              value: value,
              backgroundColor: Colors.accents[4][100],
              color: Colors.accents[4],
              strokeWidth: 10,
            ),
          ),
          if (isRun)
            Icon(
              Icons.stop_rounded,
              color: Colors.accents[4],
              size: 80,
            ),
          if (!isRun)
            Icon(
              Icons.play_arrow_rounded,
              color: Colors.accents[4],
              size: 80,
            ),
          // Text(
          //   'إبدأ',
          //   style: TextStyle(
          //     fontSize: 50,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.accents[4],
          //   ),
          // ),
        ],
      ),
    );
  }

  int gameLengeth() {
    int customLength = 10, timeBetweenChars = 1;
    int total = 0;
    for (int i = 0; i < characters.length; i++) {
      Character char = characters[i];
      if (char.isInGame) {
        total +=
            char.openLength + char.delay + char.closeLength + timeBetweenChars;
      }
    }
    return total + customLength;
  }

  Future startGame() async {
    value = null;
    backgraoundController = await player.loop('sounds/wolvesBackground.m4a');
    await Future.delayed(Duration(seconds: 2));
    if (isRun) forgraound = await player.play('sounds/closeYourEyes.m4a');
    
    await Future.delayed(Duration(seconds: 2));

    if (isRun) {
      for (int i = 0; i < characters.length && isRun; i++) {
        Character char = characters[i];
        if (char.isInGame) {
          if (isRun) {
            forgraound = await player.play('sounds/${char.openSoundName}');
          }

          if (isRun) {
            await Future.delayed(
                Duration(seconds: char.openLength + char.delay));
          }

          if (isRun) {
            forgraound = await player.play('sounds/${char.closeSoundName}');
          }
          await Future.delayed(Duration(seconds: char.closeLength + 2));
        }
      }
    }

    if (isRun) {
      backgraoundController.stop();
    }

    if (isRun) {
      forgraound = await player.play('sounds/all open.m4a');
      await Future.delayed(Duration(seconds: 4));
    }
    setState(() {
      isRun = false;
      value = 0.0;
    });
  }

  stopGame() {
    value = 0.0;

    if (backgraoundController != null) {
      backgraoundController.stop();
    }

    if (forgraound != null) {
      forgraound.stop();
    }
  }
}
