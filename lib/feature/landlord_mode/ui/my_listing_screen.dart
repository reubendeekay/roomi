import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'my_listing_active.dart';

class MyListingScreen extends StatefulWidget {
  @override
  _MyListingScreenState createState() => _MyListingScreenState();
}

class _MyListingScreenState extends State<MyListingScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _activeTabIndex = 0;

  void _setActiveTabIndex() {
    setState(() {
      _activeTabIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    _tabController =
        TabController(length: 1, vsync: this, initialIndex: _activeTabIndex);
    _tabController.addListener(_setActiveTabIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: SavedWidget.createAppBarWidget(
          tabName: [
            'All Listings',
          ],
          tabController: _tabController,
          height: height,
          hasAction: true,
          title: 'My Listing'),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyListingActive(),
        ],
      ),
    );
  }
}
