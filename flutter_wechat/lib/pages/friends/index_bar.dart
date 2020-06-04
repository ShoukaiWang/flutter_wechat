import 'package:flutter/material.dart';
import 'package:flutterwechat/const.dart';

class IndexBar extends StatefulWidget {
  final void Function(String str) indexBarCallBack;

  IndexBar({this.indexBarCallBack});

  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  Color _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indocatorHidden = true;

  int getIndex(BuildContext context, Offset globalPosition) {
    RenderBox box = context.findRenderObject();
    double y = box.globalToLocal(globalPosition).dy;
    var itemHeight = ScreenHeight(context) / 2 / INDEX_WORDS.length;
    int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);
    return index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
        child: Text(
          INDEX_WORDS[i],
          style: TextStyle(fontSize: 10, color: _textColor),
        ),
      ));
    }
    return Positioned(
        right: 0.0,
        height: ScreenHeight(context) / 2,
        top: ScreenHeight(context) / 8,
        width: 120,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment(0, _indicatorY),
              width: 100,
              child: _indocatorHidden
                  ? null
                  : Stack(
                      alignment: Alignment(-0.2, 0),
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/气泡.png'),
                          width: 60,
                        ),
                        Text(
                          _indicatorText,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),
            ),
            GestureDetector(
              child: Container(
                width: 20,
                color: _bkColor,
                child: Column(
                  children: words,
                ),
              ),
              onTapDown: (TapDownDetails details) {
                int index = getIndex(context, details.globalPosition);
                setState(() {
                  _indicatorText = INDEX_WORDS[index];
                  _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
                  _indocatorHidden = false;
                });
                widget.indexBarCallBack(INDEX_WORDS[index]);
              },
              onTapUp: (TapUpDetails details) {
                setState(() {
                  _indocatorHidden = true;
                  _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
                  _textColor = Colors.black;
                });
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                int index = getIndex(context, details.globalPosition);
                setState(() {
                  _indicatorText = INDEX_WORDS[index];
                  _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
                  _indocatorHidden = false;
                });
                widget.indexBarCallBack(INDEX_WORDS[index]);
              },
              onVerticalDragDown: (DragDownDetails details) {
                int index = getIndex(context, details.globalPosition);
                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.2 / 28 * index - 1.1;
                _indocatorHidden = false;
                widget.indexBarCallBack(INDEX_WORDS[index]);
                setState(() {
                  _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
                  _textColor = Colors.white;
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                setState(() {
                  _indocatorHidden = true;
                  _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
                  _textColor = Colors.black;
                });
              },
            ),
          ],
        ));
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
