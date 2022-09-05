import 'package:flutter/material.dart';
import 'package:mini_store_app/providers/users_provider.dart';
import 'package:provider/provider.dart';
import '../resources/string_manager.dart';

import '../widgets/users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersList = usersProvider.getUsers;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allUsers),
      ),
      body: usersList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: usersList[index],
                  child: const UsersWidget(),
                );
              },
            ),
    );
  }
}
