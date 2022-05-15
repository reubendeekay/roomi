import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_bloc.dart';
import 'package:roomy/common/bloc/connectivity/connectivity_state.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/providers/location_provider.dart';

import '../data_test.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    Provider.of<LocationProvider>(context, listen: false).getCurrentLocation();

    return Scaffold(
      appBar: TenantListingWidget.createAppBarWidget(
          height: height, title: 'Nairobi County,Kenya'),
      body: ListPostWidget(listPost: DataTest.listPost),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return state is InternetAvailable
              ? Container(
                  width: width / 190 * 58,
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
                          // await LocationPermissions().requestPermissions();
                          final loc = Provider.of<LocationProvider>(context,
                              listen: false);

                          if (loc.locationData == null) {
                            await loc.getCurrentLocation();
                          }
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
              : const SizedBox();
        },
      ),
    );
  }
}
