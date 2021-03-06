import 'package:flutter/material.dart';
import 'package:hello/presentation/custom_icons_icons.dart';
import 'package:hello/views/collectionWidget.dart';
import 'package:hello/views/repliedBodyWidget.dart';

import './views/tweet.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (_currentIndex == 0)
            ? Text('Emergency')
            : (_currentIndex == 1) ? Text('Feedback') : Text('Replied'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CollectionWidget('feedback'),
          CollectionWidget('feedback'),
          RepliedBodyWidget('replied')
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Tweet()),
          );
        },
        tooltip: 'New Tweet',
        label: Text('New Tweet'),
        icon: Icon(CustomIcons.new_tweet),
        elevation: 24.0,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 16.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              color: (_currentIndex == 0) ? Colors.blue : Colors.white,
              tooltip: 'Emergency',
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(CustomIcons.emergency),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                  _tabController.animateTo(0);
                });
              },
            ),
            IconButton(
              iconSize: 30.0,
              color: (_currentIndex == 1) ? Colors.blue : Colors.white,
              tooltip: 'Feedback',
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(CustomIcons.feedback),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                  _tabController.animateTo(1);
                });
              },
            ),
            Spacer(),
            IconButton(
              iconSize: 30.0,
              color: (_currentIndex == 2) ? Colors.blue : Colors.white,
              tooltip: 'Replied',
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(CustomIcons.replied),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                  _tabController.animateTo(2);
                });
              },
            ),
          ],
        ),
        color: Colors.deepOrangeAccent[200],
        // shape: CircularNotchedRectangle(),
      ),
    );
  }
}
