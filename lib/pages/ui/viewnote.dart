import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewNotes extends StatefulWidget {
  ViewNotes({Key key}) : super(key: key);

  @override
  _ViewNotesState createState() => _ViewNotesState();
}

class _ViewNotesState extends State<ViewNotes> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("notes");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ref.get(),
        builder: (context, snapshot) {
          return snapshot.hasData != null
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    Map data = snapshot.data.docs[index].data();
                    return Card(
                        color: Colors.green[100],
                        child: Text(
                          "${data["title"]}",
                          style: TextStyle(fontSize: 24, color: Colors.black87),
                        ));
                  })
              : Scaffold();
          // return Container();
        },
      ),
    );
  }
}
