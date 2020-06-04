import 'package:flutter/material.dart';
import 'package:flutterwechat/pages/chat_page.dart';
import 'package:flutterwechat/pages/discover/discover.dart';
import 'package:flutterwechat/pages/friends/friends.dart';
import 'package:flutterwechat/pages/profile.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 1;
  List<Widget> _pages = [
    ChatPage(),
    FriendsPage(),
    DiscoverPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedFontSize: 12,
          currentIndex: _currentIndex,
          fixedColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/tabbar_chat.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_chat_hl.png',
                height: 20,
                width: 20,
              ),
              title: Text('微信'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), title: Text('通讯录')),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), title: Text('发现')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text('我')),
          ],
        ),
      ),
    );
  }
}
