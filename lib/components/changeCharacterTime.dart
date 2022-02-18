import 'package:flutter/material.dart';
import 'package:wolfs/models/character.dart';

class ChanageCharacterTime extends StatefulWidget {
  final Character char;

  ChanageCharacterTime(this.char);

  @override
  State<ChanageCharacterTime> createState() => _ChanageCharacterTimeState();
}

class _ChanageCharacterTimeState extends State<ChanageCharacterTime> {
  double value;
  bool isCharAvailable = true;

  @override
  void initState() {
    super.initState();
    value = widget.char.delay / 10;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.cyan[800],
        checkColor: Colors.blue[900],
        value: widget.char.isInGame,
        onChanged: (newValue) {
          setState(() => widget.char.isInGame = newValue);
        },
      ),
      title: Text(widget.char.name),
      subtitle: Text('الوقت بالثانية: ${widget.char.delay}'),
      trailing: Container(
        width: 170,
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(0.0),
        child: Slider(
          value: widget.char.delay / 10,
          min: 0.1,
          onChanged: (newValue) {
            setState(() {
              widget.char.delay = (newValue * 10).toInt();
            });
          },
        ),
      ),
    );
  }
}
