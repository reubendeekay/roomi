import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_bloc.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'roommate_current.dart';
import 'roommate_find_new.dart';
import 'roommate_saved.dart';

class RoommateScreen extends StatefulWidget {
  @override
  _RoommateScreenState createState() => _RoommateScreenState();
}

class _RoommateScreenState extends State<RoommateScreen>
    with SingleTickerProviderStateMixin {
  bool filter = false;
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
            'CURRENT',
          ],
          tabController: _tabController,
          hasAction: false,
          height: height,
          title: 'My Tenant'),
      body: TabBarView(
        controller: _tabController,
        children: [
          RoommateCurrent(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return state is InternetAvailable
              ? (_activeTabIndex == 2
                  ? Container(
                      width: 90,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 5,
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                filter = !filter;
                              });
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: FittedBox(
                                    child: Text(
                                      'Filter',
                                      style: AppWidget.boldTextFieldStyle(
                                          color: const Color(0xFF020433),
                                          height: 17.07,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'images/tenant_mode/ic_filter@3x.png',
                                  height: 16,
                                  width: 16,
                                  fit: BoxFit.cover,
                                  color: const Color(0xFF020433),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox())
              : const SizedBox();
        },
      ),
    );
  }
}
