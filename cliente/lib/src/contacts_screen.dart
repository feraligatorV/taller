import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import 'api.dart';
import 'contacts_listing.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final ContacsApi api = ContacsApi();

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List contacts = [];
  var index = 0;
  bool loading = true;

  @override
  void initState() {
    if (contacts.length > index) {
      super.initState();
      widget.api.getContacts().then((data) {
        setState(() {
          contacts = data;
          loading = false;
        });
      });
    }
  }

  void _addContact() {
    final faker = Faker();
    final person = faker.person;
    final fullName = '${person.firstName()} ${person.lastName()}';
    setState(() {
      contacts.add({'name': fullName});
    });
  }

  void _deleteContact(String id) {
    setState(() {
      contacts.removeWhere((contact) => contact['name'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ContactsListing(
              contacts: contacts,
              onAdd: _addContact,
              onDelete: _deleteContact,
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'Refresh list',
            backgroundColor: Colors.purple,
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: _addContact,
            tooltip: 'Add new contact',
            child: Icon(Icons.person_add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
