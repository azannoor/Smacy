import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

class movie extends StatefulWidget {
  final String docId;
   movie({required this.docId});

  @override
  State<movie> createState() => _movieState();
}

class _movieState extends State<movie> {
  CollectionReference users = FirebaseFirestore.instance.collection('movie');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.docId).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text('movieName:${data['movieName']}');
      }
      return Text('loading');
    }));
  }
}
