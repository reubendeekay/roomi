import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';

class PendingPosts extends StatelessWidget {
  const PendingPosts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Posts',
            style: TextStyle(
              color: Colors.black,
            )),
        elevation: 0,
      ),
      body: ListPostWidget(
        isPending: true,
      ),
    );
  }
}
