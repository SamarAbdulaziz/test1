import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/contacts/contactsCubit/contacts_cubit.dart';
import 'package:test1/contacts/contactsScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsCubit>(
      create: (context) => ContactsCubit()..openContactsDatabase(),
      child: MaterialApp(
        title: 'Flutter Coontacts App',
        home: ContactsScreen(),
      ),
    );
  }
}