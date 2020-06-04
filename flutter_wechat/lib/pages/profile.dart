import 'package:flutter/material.dart';
import 'package:flutterwechat/const.dart';
import 'package:flutterwechat/pages/discover/discover_cell.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget headerWidget() {
    return Container(
      color: Colors.white,
      height: 200,
      child: Container(
        margin: EdgeInsets.only(top: 100, bottom: 20, left: 16),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('images/Hank.png'), fit: BoxFit.cover)),
            ),
            Container(
              width: ScreenWidth(context) - 95,
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'SK',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '微信号:1234',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Image(
                          image: AssetImage('images/icon_right.png'),
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: WeChatThemeColor,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: <Widget>[
                  headerWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信 支付.png',
                    title: '支付',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信收藏.png',
                    title: '收藏',
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: 50, height: 0.5, color: Colors.white),
                      Container(height: 0.5, color: Colors.grey)
                    ],
                  ), //分割线
                  DiscoverCell(
                    imageName: 'images/微信相册.png',
                    title: '相册',
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: 50, height: 0.5, color: Colors.white),
                      Container(height: 0.5, color: Colors.grey)
                    ],
                  ), //分割线
                  DiscoverCell(
                    imageName: 'images/微信卡包.png',
                    title: '卡包',
                  ),
                  Row(
                    children: <Widget>[
                      Container(width: 50, height: 0.5, color: Colors.white),
                      Container(height: 0.5, color: Colors.grey)
                    ],
                  ), //分割线
                  DiscoverCell(
                    imageName: 'images/微信表情.png',
                    title: '表情',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DiscoverCell(
                    imageName: 'images/微信设置.png',
                    title: '设置',
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 25,
            color: Color.fromRGBO(0, 0, 0, 0),
            margin: EdgeInsets.only(top: 44, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image(
                  image: AssetImage('images/相机.png'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
