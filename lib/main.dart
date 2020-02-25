import 'package:flutter/material.dart';
import 'package:flutter_music/navigator.dart';
import 'package:flutter_music/pages/index.dart';
import 'package:flutter_music/pages/music.dart';
import 'package:flutter_music/pages/my.dart';
import 'package:flutter_music/pages/video.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_music/helpers/localstroage.dart';
import 'navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String key = '';

  Future getIsFirstLoading() async {
    SharedPreferences getIsFirst = await SharedPreferences.getInstance();
    key = getIsFirst.get(localstroage().first_load);
    print(key);
    if (key == null || key != 'true') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LiquidPage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
//    getIsFirstLoading();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
        menu: Menu(), //抽屉区域布局
        screenSelectedBuilder: (position, controller) {
          Widget screenCurrent;
          String title;
          switch(position){
            case 0 : screenCurrent = Index(); title = '首页'; break;
            case 1 : screenCurrent = videoIndex(); title = '视频中心'; break;
            case 2 : screenCurrent = musicIndex(); title = '音乐'; break;
          }
          return Scaffold(
            body: screenCurrent,
          );
        });
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            child: Text("首页",style: TextStyle(color: Colors.white,fontSize: 20)),
            onPressed: (){
              SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(0);
            },
          ),
          FlatButton(
            child: Text("视频中心",style: TextStyle(color: Colors.white,fontSize: 20)),
            onPressed: (){
              SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(1);
            },
          ),
          FlatButton(
            child: Text("音乐",style: TextStyle(color: Colors.white,fontSize: 20)),
            onPressed: (){
              SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(2);
            },
          )
        ],
      ),
    );
  }
}

