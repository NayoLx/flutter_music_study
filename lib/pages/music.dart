
import 'package:flutter/material.dart';

void main() => runApp(musicIndex());

class musicIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: contextPage(),
      ),
    );
  }
}

class contextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => contextPageState();
}

class contextPageState extends State<contextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('hello '),
      ),
    );
  }
}
