import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReceiveData extends StatefulWidget {
  @override
  _ReceiveDataState createState() => _ReceiveDataState();
}

void initState() {}

class _ReceiveDataState extends State<ReceiveData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order List')),
      body: StreamBuilder(
        stream: Firestore.instance.collection('orderlist').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading...');
          return Column(
            children: <Widget>[
              Text(snapshot.data.documents[0]['name']),
              Text(snapshot.data.documents[0]['dues'].toString()),
              // Text(snapshot.data.documents[0]['Date'].toString()),
              // Text(snapshot.data.documents[0]['Order Quantity'].toString()),
              // Text(snapshot.data.documents[0]['Return Empty'].toString()),
            ],
          );
        },
      ),

      // body: StreamBuilder<QuerySnapshot>(
      //     stream: Firestore.instance.collection('books').snapshots(),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasError)
      //         return new Text('Error: ${snapshot.error}');
      //       switch (snapshot.connectionState) {
      //         case ConnectionState.waiting:
      //           return new Text('Loading...');
      //         default:
      //           return new ListView(
      //             children: snapshot.data.documents
      //                 .map((DocumentSnapshot document) {
      //               return new ListTile(
      //                 title: new Text(document['title']),
      //                 subtitle: new Text(document['author']),
      //               );
      //             }).toList(),
      //             //)
      //           );
      //       }
      //     })
    );
  }
}
