// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:ro_mate/HomeScreen.dart';
// import 'package:ro_mate/CustomerForm.dart';
// import 'CustomerDetail.dart';
import 'CustomerForm.dart';
import 'HomeScreen.dart';
// import 'firestoreservice.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  //to display the firestore data on screen(retrive data from firestore)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              var root =
                  MaterialPageRoute(builder: (context) => new HomeScreen());
              Navigator.pushReplacement(context, root);
            }),
        title: Text("Customer List"),
      ),
      // resizeToAvoidBottomInset: false,
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height - 80,
      //         child: ListView.builder(
      //             itemCount: items.length,
      //             itemBuilder: (context, index) {
      //               return Stack(children: <Widget>[
      //                 Column(children: <Widget>[
      //                   Padding(
      //                     padding: EdgeInsets.only(left: 8.0, right: 8.0),
      //                     child: Container(
      //                       width: MediaQuery.of(context).size.width,
      //                       height: 80.0,
      //                       child: Padding(
      //                         padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      //                         child: Material(
      //                           color: Colors.white,
      //                           elevation: 14.0,
      //                           shadowColor: Color(0x802196F3),
      //                           child: Center(
      //                             child: Padding(
      //                               padding: EdgeInsets.all(8.0),
      //                               child: Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.spaceBetween,
      //                                 children: <Widget>[
      //                                   todoType('${items[index].type}'),
      //                                   Text(
      //                                     '${items[index].name}',
      //                                     style: TextStyle(
      //                                         color: Colors.black,
      //                                         fontSize: 20.0),
      //                                   ),
      //                                   Column(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.center,
      //                                     children: <Widget>[
      //                                       Text(
      //                                         '${items[index].mobilenumber}',
      //                                         style: TextStyle(
      //                                             color: Colors.black,
      //                                             fontSize: 18.0,
      //                                             fontWeight: FontWeight.bold),
      //                                       ),
      //                                     ],
      //                                   )
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ]),
      //               ]);
      //             }),
      //       ),
      //     ],
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
        onPressed: () {
          var root =
              MaterialPageRoute(builder: (context) => CustomerDetailScreen());
          Navigator.pushReplacement(context, root);
          //    Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) =>
          //           CustomerDetailScreen()
          //CustomerDetail('', '', '')),
          //       fullscreenDialog: true),
          // );
        },
      ),
    );
  }

  // ignore: missing_return
  Widget todoType(String type) {
    switch (type) {
      case 'reseller':
        break;
      case 'consumer':
        break;
    }
  }
}
