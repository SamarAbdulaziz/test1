import 'package:flutter/material.dart';
import 'package:test1/users/usersCubit/users_cubit.dart';

class Users extends StatelessWidget {
final Map user;

  const Users({Key? key,required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        UsersCubit().get(context).selectedUserToUpdate(user: user);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32.0,
              child: Text(
                  user['id'].toString(),
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              user['name'],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
