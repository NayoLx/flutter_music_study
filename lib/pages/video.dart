import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/VideoPlayerText.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(videoIndex());

class videoIndex extends StatelessWidget {
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
  File _video;

  Size get _window => MediaQuery.of(context).size;

//  https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo-transcode-crf/60609889_0b5d29ee8e09fad4cc4f40f314d737ca_0.mp4
//  File video = await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'mp3');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                      // 该组件宽高默认填充父控件，你也可以自己设置宽高
                      child: _video == null || _video == ''
                          ? VideoPlayerText(
                              //network视频
                              url:
                                  'https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo-transcode-crf/60609889_0b5d29ee8e09fad4cc4f40f314d737ca_0.mp4',
                              title: '示例视频',
                              width: _window.width,
                              height: _isFullScreen
                                  ? _window.height
                                  : _window.width / 16 * 9,
                            )
                          : VideoPlayerText(
                              //本地file视频
                              file: _video,
                              title: '示例视频',
                              width: _window.width,
                              height: _isFullScreen
                                  ? _window.height
                                  : _window.width / 16 * 9,
                            )),
                ),
              ),
            ];
          },
          body: Center(),
        ),
        floatingActionButton: !_isFullScreen
            ? FloatingActionButton(
                onPressed: () async {
                  File video =
                      await ImagePicker.pickVideo(source: ImageSource.gallery);
                  if (video != null && video != '') {
                    setState(() {
                      _video = video;
                    });
                  }
                },
                tooltip: 'pickImage',
                child: new Icon(Icons.add),
              )
            : null);
  }
}

//Widget build(BuildContext context) {
//  return Scaffold(
//      body: NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//          return <Widget> [
//            SliverAppBar(
//              expandedHeight: 200,
//              floating: false,
//              pinned: false,
//              flexibleSpace: FlexibleSpaceBar(
//                background: Container(
//                  // 该组件宽高默认填充父控件，你也可以自己设置宽高
//                    child: _video == null || _video == ''
//                        ? VideoPlayerText(
//                      //network视频
//                      url:
//                      'https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo-transcode-crf/60609889_0b5d29ee8e09fad4cc4f40f314d737ca_0.mp4',
//                      title: '示例视频',
//                      width: _window.width,
//                      height:
//                      _isFullScreen ? _window.height : _window.width / 16 * 9,
//                    )
//                        : VideoPlayerText(
//                      //本地file视频
//                      file: _video,
//                      title: '示例视频',
//                      width: _window.width,
//                      height:
//                      _isFullScreen ? _window.height : _window.width / 16 * 9,
//                    )),
//              ),
//            ),
//          ];
//        },
//        body: Center(),
//      ),
//      floatingActionButton: !_isFullScreen
//          ? FloatingActionButton(
//        onPressed: () async {
//          File video =
//          await ImagePicker.pickVideo(source: ImageSource.gallery);
//          if (video != null && video != '') {
//            setState(() {
//              _video = video;
//            });
//          }
//        },
//        tooltip: 'pickImage',
//        child: new Icon(Icons.add),
//      )
//          : null);
//}
