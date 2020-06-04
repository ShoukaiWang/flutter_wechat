import 'package:flutter/material.dart';
import 'package:flutterwechat/const.dart';
import 'package:flutterwechat/pages/discover/discover_child_page.dart';
import 'package:flutterwechat/pages/friends/friends_data.dart';

import 'friends_cell.dart';
import 'index_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final List<Friends> _headerData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  final List<Friends> _listData = [];
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _listData
      ..addAll(datas)
      ..addAll(datas)
      ..sort((Friends a, Friends b) {
        return a.indexLetter.compareTo(b.indexLetter);
      });
    _scrollController = ScrollController();

    var itemHeight = 54.5;
    var _groupOffset = itemHeight * _headerData.length;
    for (int i = 0; i < _listData.length; i++) {
      if (i < 1) {
        _groupOffsetMap.addAll({_listData[i].indexLetter: _groupOffset});
        _groupOffset += (itemHeight + 30);
      } else if (_listData[i].indexLetter == _listData[i - 1].indexLetter) {
        _groupOffset += itemHeight;
      } else {
        _groupOffsetMap.addAll({_listData[i].indexLetter: _groupOffset});
        _groupOffset += (itemHeight + 30);
      }
    }
  }

  Widget _itemForRow(BuildContext context, int index) {
    if (index < _headerData.length) {
      return FriendCell(
        imageAssets: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    }
    bool _isHiddenIndexLetter = (index - 4 > 0 &&
        _listData[index - 4].indexLetter == _listData[index - 5].indexLetter);
    return FriendCell(
      imageUrl: _listData[index - 4].imageUrl,
      name: _listData[index - 4].name,
      groupTitle:
          _isHiddenIndexLetter ? null : _listData[index - 4].indexLetter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: WeChatThemeColor,
          title: Text('通讯录'),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => DiscoverChildPage(
                          title: '添加朋友',
                        )));
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Image(
                  image: AssetImage('images/icon_friends_add.png'),
                  width: 25,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: WeChatThemeColor,
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _listData.length + _headerData.length,
                  itemBuilder: _itemForRow),
            ),
            IndexBar(
              indexBarCallBack: (String str) {
                if (_groupOffsetMap[str] != null) {
                  _scrollController.animateTo(_groupOffsetMap[str],
                      duration: Duration(microseconds: 1),
                      curve: Curves.easeIn);
                }
              },
            ),
          ],
        ));
  }
}
