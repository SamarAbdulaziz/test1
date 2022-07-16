import 'package:flutter/material.dart';
import 'package:test1/contacts/contactsCubit/contacts_cubit.dart';

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Contenct',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              ContactsCubit().get(context).updateContactsDatabase();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: ContactsCubit().get(context).nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
               controller: ContactsCubit().get(context).phoneController,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
