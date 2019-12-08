import 'package:flutter/material.dart';
import 'MovieReleaseTabs.dart';

class MoviesTopTabs extends StatefulWidget {
  MoviesTopTabs(this.colorVal);
  final int colorVal;
  _MoviesTopTabsState createState() => _MoviesTopTabsState();
}

class _MoviesTopTabsState extends State<MoviesTopTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 7);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorWeight: 4.0,
          indicatorColor: Color(0xffe91e63),
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            _tabItem(
              index: 0,
              text: 'For You',
              icon: Icons.comment,
            ),
            _tabItem(
              index: 1,
              text: 'TV',
              icon: Icons.tv,
            ),
            _tabItem(
              index: 2,
              text: 'TopSelling',
              icon: Icons.swap_horizontal_circle,
            ),
            _tabItem(
              index: 3,
              text: 'New Releases',
              icon: Icons.switch_video,
            ),
            _tabItem(
              index: 4,
              text: 'Genres',
              icon: Icons.format_shapes,
            ),
            _tabItem(
              index: 5,
              text: 'Studio',
              icon: Icons.filter_drama,
            ),
            _tabItem(
              index: 6,
              text: 'Family',
              icon: Icons.home,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            height: 200.0,
            child: Center(child: Text('For you')),
          ),
          Container(
            height: 200.0,
            child: Center(child: Text('TV')),
          ),
          Container(
            height: 200.0,
            child: Center(child: Text('Top Sellings')),
          ),
          MovieReleaseTabs(),
          Container(
            height: 200.0,
            child: Center(child: Text('Genres')),
          ),
          Container(
            height: 200.0,
            child: Center(child: Text('Studio')),
          ),
          Container(
            height: 200.0,
            child: Center(child: Text('Family')),
          ),
        ],
      ),
    );
  }

  Widget _tabItem({IconData icon, int index, String text}) {
    Color isColor =
        _tabController.index == index ? Color(widget.colorVal) : Colors.grey;
    return Tab(
      icon: Icon(icon, color: isColor),
      child: Text(text, style: TextStyle(color: isColor)),
    );
  }
}
