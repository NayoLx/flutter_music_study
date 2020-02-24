import 'package:flutter/cupertino.dart';
import 'package:flutter_music/main.dart';
import 'package:flutter_music/pages/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_music/helpers/localstroage.dart';

void main() => runApp(LiquidPage());

class LiquidPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: LiquidPageState(),
    );
  }
}

class LiquidPageState extends StatefulWidget {
  _liquidPageState createState() => _liquidPageState();
}

class _liquidPageState extends State<LiquidPageState> {
  WaveType currentAnimate = WaveType.circularReveal;

  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1000, height: 2111)..init(context);
    return Container(
      child: LiquidSwipe(
        pages: <Container> [
          Container(
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                    child: Text(
                      '有趣 ？',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(43),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Text(
                    'Funny or not ?',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(43),
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.pink,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                    child: Text(
                      '简单 ？',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(43),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Text(
                    'Easy but Enrich ?',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(43),
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                    child: Text(
                      '工具 ..',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(43),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Text(
                    'Let us start..',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(43),
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.lightBlue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                    child: Text(
                      '尽在于此..',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(43),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(60)),
                    child: Text(
                      'My World..',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(43),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      'Hello World',
                      style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                    ),
                    color: Colors.green,                                                          //按钮背景颜色
                    colorBrightness: Brightness.dark,                                             //按钮亮度
                    disabledColor: Colors.grey,                                                   //失效时的背景颜色
                    disabledTextColor: Colors.grey,                                               //失效时的文本颜色
                    textColor: Colors.white,                                                      //文本颜色
                    textTheme: ButtonTextTheme.normal,                                            //按钮主题
                    splashColor: Colors.lightBlue,                                                     //墨汁飞溅的颜色
                    clipBehavior: Clip.antiAlias,                                                 //抗锯齿能力
                    shape: RoundedRectangleBorder(                                                //border圆角矩形边框
                      borderRadius: BorderRadius.only(                                             //border边框圆角
                        topRight: Radius.circular(ScreenUtil().setWidth(10)),
                        topLeft: Radius.circular(ScreenUtil().setWidth(10)),
                        bottomLeft: Radius.circular(ScreenUtil().setWidth(10)),
                        bottomRight: Radius.circular(ScreenUtil().setWidth(10)),
                      ),
                    ),
                    onPressed: () {
                      setLocalStorage();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
        fullTransitionValue: 500,//滑动阀值
        enableSlideIcon: false, //显示右侧图标
        enableLoop: false,//循环切换
        positionSlideIcon: 0.5,//右侧图标的位置
        waveType: currentAnimate,//切换效果
        onPageChangeCallback: (page) => pageChangeCallback(page),//页面切换回调
        currentUpdateTypeCallback: (updateType) => updateTypeCallback(updateType),//当前页面更新回调
      ),
    );
  }
  pageChangeCallback(int page) {
  }
  updateTypeCallback(UpdateType updateType) {
  }

  setLocalStorage() async{
    SharedPreferences set = await SharedPreferences.getInstance();
    set.setString(localstroage().first_load, 'true');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
}