import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/common/bloc/connectivity/bloc_connect.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_test.dart';

class ListingCardStyleScreen extends StatefulWidget {
  @override
  _ListingCardStyleScreenState createState() => _ListingCardStyleScreenState();
}

class _ListingCardStyleScreenState extends State<ListingCardStyleScreen> {
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: TenantListingWidget.createAppBarWidget(
          height: height, title: 'New York'),
      body: ListPostWidget(listPost: DataTest.listPost),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return state is InternetAvailable
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
                      Container(
                        width: 1,
                        height: 24,
                        color: const Color(0xFFF0F0F0),
                      ),
                      GestureDetector(
                        onTap: () {},
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
              : const SizedBox();
        },
      ),
    );
  }
}
