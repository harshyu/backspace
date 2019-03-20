// This sample shows how to use [onDeleted] to remove an entry when the
// delete button is tapped.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Flutter Code Sample for material.DeletableChipAttributes.onDeleted',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class Actor {
  const Actor(this.name, this.initials);
  final String name;
  final String initials;
}

class CastList extends StatefulWidget {
  @override
  State createState() => CastListState();
}

class CastListState extends State<CastList> {
  final List<Actor> _cast = <Actor>[
    const Actor('Aaron Burr', 'AB'),
    const Actor('Alexander Hamilton', 'AH'),
    const Actor('Eliza Hamilton', 'EH'),
    const Actor('James Madison', 'JM'),
  ];

  Iterable<Widget> get actorWidgets sync* {
    for (Actor actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: Chip(
          avatar: CircleAvatar(child: Text(actor.initials)),
          label: Text(actor.name),
          onDeleted: () {
            setState(() {
              _cast.removeWhere((Actor entry) {
                return entry.name == actor.name;
              });
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: actorWidgets.toList(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return CastList();
  }
}
