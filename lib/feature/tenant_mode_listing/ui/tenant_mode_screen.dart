import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_bloc.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_event.dart';
import 'package:roomy/feature/landlord_mode/widget/landlord_mode_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/model/item_nav_model.dart';
import 'package:roomy/feature/tenant_mode_menu/ui/my_profile_screen.dart';
import 'package:roomy/feature/tenant_mode_notification/ui/notify_message_screen.dart';
import 'package:roomy/feature/tenant_mode_saved/ui/saved_room_screen.dart';
import 'package:roomy/providers/auth_provider.dart';
import 'package:roomy/providers/location_provider.dart';

import 'listing_screen.dart';

class TenantModeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> listOption = [
    // <String, dynamic>{
    //   'icon': 'images/tenant_mode/ic_new_room@3x.png',
    //   'title': 'Post Your Room',
    // },
    // <String, dynamic>{
    //   'icon': 'images/tenant_mode/ic_switch@3x.png',
    //   'title': 'Switch to Landlord Mode',
    // },
    <String, dynamic>{
      'icon': 'images/tenant_mode/ic_setting@3x.png',
      'title': 'Settings',
    },
    <String, dynamic>{
      'icon': 'images/tenant_mode/ic_help@3x.png',
      'title': 'Log out',
    },
  ];
  @override
  _TenantModeScreenState createState() => _TenantModeScreenState();
}

class _TenantModeScreenState extends State<TenantModeScreen> {
  int _currentIndex = 0;
  List<ItemNavModel> listItemModel = [];
  bool filter = false;
  List<Widget> listNav = [];
  @override
  void initState() {
    listNav = [
      ListingScreen(),
      SavedRoomScreen(),
      NotifyMessageScreen(),
      MyProfileScreen(),
    ];
    listItemModel = [
      ItemNavModel(true, 'List', 'images/tenant_mode/ic_tab_list@3x.png'),
      ItemNavModel(
          false, 'Bookmark', 'images/tenant_mode/ic_tab_bookmark@3x.png'),
      ItemNavModel(
          false, 'Notification', 'images/tenant_mode/ic_notification@3x.png'),
      ItemNavModel(false, 'Menu', 'images/tenant_mode/ic_tab_menu@3x.png')
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationProvider>(context, listen: false).getCurrentLocation();
    Provider.of<AuthProvider>(context, listen: false).getUser();
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
            LandlordModeWidget.createItemNav(itemNavModel: listItemModel[0]),
            LandlordModeWidget.createItemNav(itemNavModel: listItemModel[1]),
            LandlordModeWidget.createItemNavStack(
                itemNavModel: listItemModel[2]),
            LandlordModeWidget.createItemNav(itemNavModel: listItemModel[3]),
            // LandlordModeWidget.createItemNavMenu(
            //     itemNavModel: listItemModel[4]),
          ],
          onTap: (value) {
            setState(() {
              _currentIndex = value;
              for (var element in listItemModel) {
                element.selected = false;
              }
              listItemModel[value].selected = true;
            });
          },
        ),
      ),
    );
  }
}
