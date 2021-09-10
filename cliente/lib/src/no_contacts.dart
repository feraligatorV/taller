import 'package:flutter/material.dart';

class NoContacts extends StatelessWidget {
  final VoidCallback onAdd;
  NoContacts({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person_outline,
            size: 80,
            color: Colors.black45,
          ),
          Text(
            'No hay contactos',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
              color: Colors.purple,
              onPressed: onAdd,
              child: Text(
                'Agrega el primero',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
