import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/ui/home.dart';
import 'package:notes/pages/ui/viewnote.dart';
// import 'package:flutter/scheduler.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String title;
  String des;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomPage()));
                      },
                      child: Icon(Icons.arrow_back_ios_outlined),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[700]),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 8.0)))),
                  ElevatedButton(
                      onPressed: add,
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[700]),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 8.0))))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration.collapsed(hintText: "Title"),
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  onChanged: (_val) {
                    title = _val;
                  },
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: const EdgeInsets.only(top: 12),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: "Notes Description "),
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    onChanged: (_val) {
                      des = _val;
                    },
                    maxLines: 20,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    ));
  }

  void add() {
    CollectionReference ref = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("notes");
    var data = {
      "title": title,
      "description": des,
    };
    ref.add(data);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomPage()));
  }
}
