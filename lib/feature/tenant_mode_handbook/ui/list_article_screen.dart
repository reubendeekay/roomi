import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_handbook/widget/handbook_widget.dart';
import 'package:roomy/feature/tenant_mode_handbook/ui/life_style_screen.dart';
import 'package:roomy/feature/tenant_mode_handbook/ui/entertainment_screen.dart';
import 'package:roomy/feature/tenant_mode_handbook/ui/healthy_screen.dart';

class ListArticleScreen extends StatefulWidget {
  @override
  _ListArticleScreenState createState() => _ListArticleScreenState();
}

class _ListArticleScreenState extends State<ListArticleScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
      appBar: HandBookWidget.createAppBarWidget(
          tabController: _tabController, height: height, title: 'Handbook'),
      body: TabBarView(
        controller: _tabController,
        children: [LifeStyleScreen(), HealthyScreen(), EntertainmentScreen()],
      ),
    );
  }
}
