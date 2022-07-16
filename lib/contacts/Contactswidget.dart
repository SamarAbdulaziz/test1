import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/contacts/EditContact.dart';
import 'package:test1/contacts/contactsCubit/contacts_cubit.dart';

class ContactItem extends StatelessWidget {
  late Map contact;

  ContactItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditScreen(),
          ),
        );
        ContactsCubit().get(context).selectContact(selected: contact);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text(
                '${contact['id']}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              radius: 30.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact['name'],
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      contact['phone'],
                      style: const TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    ContactsCubit()
                        .get(context)
                        .selectContact(selected: contact);
                    ContactsCubit()
                        .get(context).deleteContenct();
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
