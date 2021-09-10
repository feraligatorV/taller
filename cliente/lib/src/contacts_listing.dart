import 'package:flutter/material.dart';

import 'no_contacts.dart';

class ContactsListing extends StatelessWidget {
  final List contacts;
  final VoidCallback onAdd;
  final Function(String id) onDelete;

  ContactsListing(
      {required this.contacts, required this.onAdd, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? NoContacts(
            onAdd: onAdd,
          )
        : ListView(children: [
            ...contacts
                .map<Widget>(
                  (contact) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Text('FV'),
                      ),
                      title: Text(
                        contact['name'],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: FlatButton(
                        onPressed: () {
                          onDelete(contact['name']);
                        },
                        child: Icon(
                          Icons.delete,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            SizedBox(height: 70),
          ]);
  }
}
