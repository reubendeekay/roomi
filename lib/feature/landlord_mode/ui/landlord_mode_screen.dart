import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_bloc.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_event.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/landlord_mode/widget/landlord_mode_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/model/item_nav_model.dart';

import 'more_menu_screen.dart';
import 'my_listing_screen.dart';
import 'roommate_screen.dart';

class LandlordModeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> listOption = [
    <String, dynamic>{
      'icon': 'images/tenant_mode/ic_new_room@3x.png',
      'title': 'Post Your Room',
    },
    <String, dynamic>{
      'icon': 'images/tenant_mode/ic_switch@3x.png',
      'title': 'Switch to Tenant Mode',
    },
    <String, dynamic>{
      'icon': 'images/tenant_mode/ic_help@3x.png',
      'title': 'Help',
    },
    <String, dynamic>{
      'icon': 'images/tenant_mode/ic_setting@3x.png',
      'title': 'Sign out',
    },
  ];
  @override
  _LandlordModeScreenState createState() => _LandlordModeScreenState();
}

class _LandlordModeScreenState extends State<LandlordModeScreen> {
  int _currentIndex = 0;
  List<ItemNavModel> listItemModel = [];
  List<Widget> listNav = [];
  @override
  void initState() {
    listNav = [
      MyListingScreen(),
      RoommateScreen(),
      MoreMenuScreen(
        infoHeader: ListOption.myInfo,
        listOption: widget.listOption,
      ),
    ];
    listItemModel = [
      ItemNavModel(true, 'List', 'images/tenant_mode/ic_tab_list@3x.png'),
      ItemNavModel(
          false, 'Roommate', 'images/landlord_mode/ic_roommate@3x.png'),
      ItemNavModel(false, 'Menu', 'images/tenant_mode/ic_tab_menu@3x.png')
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          lazy: false,
          create: (context) => ConnectivityBloc()..add(ListenConnection()),
          child: listNav.elementAt(_currentIndex)),
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: Color.fromRGBO(2, 4, 51, 0.08),
              blurRadius: 4,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            LandlordModeWidget.createItemNavStack(
                itemNavModel: listItemModel[0]),
            LandlordModeWidget.createItemNav(itemNavModel: listItemModel[1]),
            LandlordModeWidget.createItemNavStack(
                itemNavModel: listItemModel[2]),
          ],
          onTap: (value) {
            setState(() {
              _currentIndex = value;
              for (var element in listItemModel) {
                element.selected = false;
              }
              listItemModel[_currentIndex].selected = true;
            });
          },
        ),
      ),
    );
  }
}
