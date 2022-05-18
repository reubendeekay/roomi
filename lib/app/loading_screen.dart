import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomy/feature/landlord_mode/ui/landlord_mode_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/tenant_mode_screen.dart';
import 'package:roomy/providers/auth_provider.dart';
import 'package:roomy/providers/location_provider.dart';

class InitialLoading extends StatefulWidget {
  @override
  State<InitialLoading> createState() => _InitialLoadingState();
}

class _InitialLoadingState extends State<InitialLoading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () async {
      await Provider.of<LocationProvider>(context, listen: false)
          .getCurrentLocation();
    });
    Provider.of<AuthProvider>(context, listen: false).getUser().then((value) {
      if (value.isLandlord) {
        Get.off(() => LandlordModeScreen());
      } else {
        Get.to(() => TenantModeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
