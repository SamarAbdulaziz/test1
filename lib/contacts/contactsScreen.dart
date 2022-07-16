import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/contacts/Contactswidget.dart';
import 'package:test1/contacts/addContent.dart';
import 'package:test1/contacts/contactsCubit/contacts_cubit.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> contacts = ContactsCubit().get(context).contacts;
    var cubit = ContactsCubit().get(context);
    return BlocConsumer<ContactsCubit, ContactsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Contacts',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () => cubit.deleteTable(),
                          child: Text('Delete data'),
                        ),
                      ])
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RefreshIndicator(
              onRefresh: () async {
                cubit.getContactsDatabase();
              },
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ContactItem(contact: contacts[index]),
                  separatorBuilder: (context, index) => Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                  itemCount: contacts.length),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ContactsCubit().get(context).clearControllers();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContent(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
