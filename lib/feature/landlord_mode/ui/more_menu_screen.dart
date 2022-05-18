import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/on_boarding/on_boarding_screen.dart';
import 'package:roomy/feature/tenant_mode_menu/widget/menu_widget.dart';
import 'package:roomy/providers/auth_provider.dart';

class MoreMenuScreen extends StatelessWidget {
  const MoreMenuScreen({this.infoHeader, this.listOption});
  final Map<String, String> infoHeader;
  final List<Map<String, dynamic>> listOption;
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 60),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: constraints.maxHeight / 116 * 32,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.myProfileScreen);
                  },
                  child: MenuWidget.createHeader(
                      user: user, height: constraints.maxHeight / 116 * 32),
                ),
              ),
              Container(
                color: const Color(0xFFF7F9FF),
                width: double.infinity,
                height:
                    constraints.maxHeight - constraints.maxHeight / 116 * 32,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      crossAxisCount: 2,
                      childAspectRatio: 1.1),
                  itemCount: listOption.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (index == 0) {
                          Navigator.of(context)
                              .pushNamed(Routes.postRoomScreen);
                        } else if (index == 1) {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.tenantModeScreen);
                        } else if (index == 3) {
                          await FirebaseAuth.instance.signOut();
                          Get.offAll(() => OnBoardingScreen());
                        }
                      },
                      child: MenuWidget.createItemOption(
                          context: context,
                          height: height,
                          item: listOption[index]),
                    );
                  },
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
