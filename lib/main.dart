import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wolfs/pages/home.dart';
import 'models/character.dart';

Character wolves, wolvesFriend, police, seer, robber, troublemaker, lastOne;
List<Character> characters;

void main() {
  // wolves = ;
  // wolvesFriend = ;
  // police = ;
  // seer = ;
  // robber = ;
  // troublemaker = ;
  // lastOne = ;

  characters = [
    Character(
      name: 'الذيابه',
      openSoundName: 'wolves open your eyes.m4a',
      openLength: 2,
      closeSoundName: 'wolves close.m4a',
      closeLength: 2,
      isInGame: true,
      delay: 5,
    ),
    Character(
      name: 'خوي الذيابه',
      openSoundName: 'wolves friend open.m4a',
      openLength: 5,
      closeSoundName: 'wolves friend close.m4a',
      closeLength: 5,
      isInGame: true,
      delay: 5,
    ),
    Character(
      name: 'الشرطة',
      openSoundName: 'police open.m4a',
      openLength: 2,
      closeSoundName: 'police close.m4a',
      closeLength: 2,
      isInGame: true,
      delay: 5,
    ),
    Character(
      name: 'الشروف',
      openSoundName: 'seer open.m4a',
      openLength: 2,
      closeSoundName: 'seer close.m4a',
      closeLength: 2,
      isInGame: true,
      delay: 5,
    ),
    Character(
      name: 'الحرامي',
      openSoundName: 'robber open.m4a',
      openLength: 2,
      closeSoundName: 'robber close.m4a',
      closeLength: 2,
      isInGame: true,
      delay: 5,
    ),
    Character(
      name: 'مسبب المشاكل',
      openSoundName: 'troublemaker open.m4a',
      openLength: 3,
      closeSoundName: 'troublemaker close.m4a',
      closeLength: 3,
      isInGame: true,
      delay: 5,
    ),
    Character(
      name: 'اخر واحد',
      openSoundName: 'last one open.m4a',
      openLength: 3,
      closeSoundName: 'last one close.m4a',
      closeLength: 3,
      isInGame: true,
      delay: 5,
    ),
  ];
  runApp(WolvesApp());
}

class WolvesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'),
      ],
      locale: Locale('ar'),
      title: 'لعبة الذيابة',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.amber[50],
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
