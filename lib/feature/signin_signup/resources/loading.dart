import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomy/admin/admin.dart';
import 'package:roomy/feature/landlord_mode/ui/landlord_mode_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/tenant_mode_screen.dart';
import 'package:roomy/providers/auth_provider.dart';

class InitialLoadingScreen extends StatefulWidget {
  const InitialLoadingScreen({Key key}) : super(key: key);

  @override
  State<InitialLoadingScreen> createState() => _InitialLoadingScreenState();
}

class _InitialLoadingScreenState extends State<InitialLoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () async {
      final user =
          await Provider.of<AuthProvider>(context, listen: false).getUser();
      if (user.isAdmin) {
        Get.off(() => AdminDashboard());
      } else if (user.isLandlord) {
        Get.off(() => LandlordModeScreen());
      } else {
        Get.off(() => TenantModeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
