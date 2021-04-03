// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/ui/addnote.dart';
import 'package:notes/pages/ui/viewnote.dart';
// import 'package:notes/pages/ui/bottom.dart';

class HomPage extends StatefulWidget {
  HomPage({Key key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _children = [ViewNotes(), AddNote(), ViewNotes()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text(
            "Notes",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(Icons.list),
              ),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(Icons.add),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(Icons.restore_from_trash),
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => AddNote()));
                },
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
