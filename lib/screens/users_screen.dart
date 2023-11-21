import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/user_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../widgets/users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: FutureBuilder<List<UserModel>>(
        future: APIHAndler.getUserDetails(), // Fixed typo here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                  "An error occurred ${snapshot.error}"), // Fixed typo here
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) {
              return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: const UsersWidget(),
              );
            },
          );
        },
      ),
    );
  }
}
