import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/VideoPlayerText.dart';
import 'package:image_picker/image_picker.dart';

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
