import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'package:roomy/admin/all_landlords.dart';
import 'package:roomy/admin/alll_users_screen.dart';
import 'package:roomy/admin/pending_posts.dart';
import 'package:roomy/feature/on_boarding/on_boarding_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/item_post.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';
import 'package:roomy/feature/tenant_mode_notification/ui/message_screen.dart';
import 'package:roomy/feature/tenant_mode_notification/ui/notify_message_screen.dart';
import 'package:roomy/providers/post_provider.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'System Administration',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.logout, color: Colors.black),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(() => OnBoardingScreen());
              }),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildActionButton(
              color: Colors.green,
              icon: Icons.person_outline,
              onPressed: () {
                Get.to(() => const AllUsersScreen());
              },
              title: 'Manage\nUsers',
            ),
            buildActionButton(
              color: Colors.orange,
              icon: Icons.house_outlined,
              onPressed: () {
                Get.to(() => const AllLandlordsScreen());
              },
              title: 'Manage\nLandlords',
            ),
            buildActionButton(
              color: Colors.blue,
              icon: Icons.show_chart,
              onPressed: () async {
                Get.to(() => const PendingPosts());
              },
              title: 'Pending\nRooms',
            ),
            buildActionButton(
              color: Colors.red,
              icon: Icons.people_outline_outlined,
              onPressed: () {
                Get.to(() => NotifyMessageScreen());
              },
              title: 'Users\nSupport',
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Recent Rooms',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Expanded(
            child: ListPostWidget(
          isAdmin: true,
        )),
      ]),
    );
  }

  Widget buildActionButton({
    IconData icon,
    Function onPressed,
    String title,
    Color color,
  }) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
