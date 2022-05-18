import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_notification/widget/notify_widget.dart';
import 'message_screen.dart';
import 'notify_screen.dart';

class NotifyMessageScreen extends StatefulWidget {
  @override
  _NotifyMessageScreenState createState() => _NotifyMessageScreenState();
}

class _NotifyMessageScreenState extends State<NotifyMessageScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: NotifyWidget.createAppBarWidget(
          tabController: _tabController,
          height: height,
          title: 'Notification',
          amountMess: 2,
          amountNotify: 1),
      body: TabBarView(
        controller: _tabController,
        children: [
          MessageScreen(),
          NotifyScreen(),
        ],
      ),
    );
  }
}
