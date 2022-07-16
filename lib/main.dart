import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/contacts/contactsCubit/contacts_cubit.dart';
import 'package:test1/contacts/contactsScreen.dart';
import 'package:test1/counter/CounterCubit/counter_cubit.dart';
import 'package:test1/counter/counterScreen.dart';
import 'package:test1/mobileScreen.dart';
import 'package:test1/users/usersCubit/users_cubit.dart';
import 'package:test1/users/usersScreen.dart';
import 'package:test1/webScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider<UsersCubit>(
            create: (context) => UsersCubit()..InitializeUsersDatabase()),
        BlocProvider<ContactsCubit>(
            create: (context) => ContactsCubit()..openContactsDatabase())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.transparent),
          ),
        ),
        home: Builder(
          builder: ((context) {
            // print(MediaQuery.of(context).size.width.toInt());
            // print(MediaQuery.of(context).size.height.toInt());
            if (MediaQuery.of(context).size.width.toInt() > 600) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 2.0,
                ),
                child: WebScreen(),
              );
            }
            return ContactsScreen();
          }),
        ),
      ),
    );
  }
}