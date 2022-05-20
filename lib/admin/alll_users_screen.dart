import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:roomy/admin/user_actions.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/providers/auth_provider.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Users',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<UserModel>>(
          future:
              Provider.of<AuthProvider>(context, listen: false).getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return ListView(
                children: snapshot.data
                    .map(
                      (e) => ListTile(
                        title: Row(
                          children: [
                            Text(e.name),
                            const SizedBox(
                              width: 5,
                            ),
                            if (e.isAdmin)
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
                              )
                          ],
                        ),
                        onTap: () {
                          actionSheet(context, e);
                        },
                        subtitle: Text(e.email),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(e.imgAvt),
                        ),
                      ),
                    )
                    .toList());
          }),
    );
  }
}
