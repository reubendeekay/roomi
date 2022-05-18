import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';
import 'package:roomy/feature/tenant_mode_saved/ui/saved_people_screen.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_bloc.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedRoomScreen extends StatefulWidget {
  @override
  _SavedRoomScreenState createState() => _SavedRoomScreenState();
}

class _SavedRoomScreenState extends State<SavedRoomScreen>
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
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: SavedWidget.createAppBarWidget(
          tabName: [
            'ROOM',
          ],
          tabController: _tabController,
          hasAction: false,
          height: height,
          title: 'Saved'),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ListPostWidget(
            isSaved: true,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return state is InternetAvailable
              ? (_activeTabIndex == 0
                  ? Container(
                      width: width / 125 * 58,
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
                            onTap: () async {
                              await LocationPermissions().requestPermissions();
                              Navigator.of(context)
                                  .pushNamed(Routes.listingMapViewScreen);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: FittedBox(
                                    child: Text(
                                      'Map',
                                      style: AppWidget.boldTextFieldStyle(
                                          color: const Color(0xFF020433),
                                          height: 17.07,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'images/tenant_mode/ic_map@3x.png',
                                  height: 16,
                                  width: 16,
                                  fit: BoxFit.cover,
                                  color: const Color(0xFF020433),
                                )
                              ],
                            ),
                          ),
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
