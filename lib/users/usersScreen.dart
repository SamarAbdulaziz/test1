import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/users/usersCubit/users_cubit.dart';
import 'package:test1/users/usersWidget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Users',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: UsersCubit().get(context).nameEditingController,
                  decoration: InputDecoration(
                    labelText: 'User name',
                    suffixIcon: TextButton(
                      onPressed: () {
                        UsersCubit().get(context).insertDatabase();
                      },
                      child: Text(
                        UsersCubit().get(context).selectedUser.isEmpty
                            ? 'Save'
                            : 'Update',
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      UsersCubit().get(context).getDatabase();
                    },
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            Users(user: UsersCubit().get(context).users[index]),
                        separatorBuilder: (context, index) => Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey[300],
                            ),
                        itemCount: UsersCubit().get(context).users.length),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
