import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_music/pages/MyVideo.dart';

void main() => runApp(Index());

class Index extends StatelessWidget {
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
  bool get _isFullScreen =>
      MediaQuery.of(context).orientation == Orientation.landscape;
  Size get _window => MediaQueryData.fromWindow(window).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // 该组件宽高默认填充父控件，你也可以自己设置宽高
        child: MyVideo(
          url:
              'https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo-transcode-crf/60609889_0b5d29ee8e09fad4cc4f40f314d737ca_0.mp4',
          title: '示例视频',
          width: _isFullScreen ? _window.height : _window.width,
          height: _isFullScreen ? _window.width : _window.width / 16 * 9,
        ),
      ),
    );
  }
}
