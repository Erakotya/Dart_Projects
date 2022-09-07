import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/pAbzTgR8XYOWyUUvenFR/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          //builder function is reexecuted whenever the stream gives us a new value
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.all(8),
              child: Text('This Works'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Firestore.instance doesnt work, gotta do FirebaseFirestore.instance
          // FirebaseFirestore.instance
          //     .collection('chats/pAbzTgR8XYOWyUUvenFR/messages')
          //     .snapshots()
          //     .listen((data) {
          //   data.docs.forEach((document) {
          //     print(document['text']);
          //   });
          //   //print(data.docs[0]['text']);
          // });
        },
      ),
    );
  }
}
//stream is a dart object that emits a new value whenever a data source changes
