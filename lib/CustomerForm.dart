import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'CustomerDetail.dart';
// import 'firestoreservice.dart';

//for 3 dot dropdown menu
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
  @override
  String toString() => title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'New Order'),
  const Choice(title: 'Recieved Payment'),
  const Choice(title: 'Show History'),
];

class CustomerDetailScreen extends StatefulWidget {
  // final CustomerDetail detail;
  // CustomerDetailScreen(this.detail);
  @override
  _CustomerDetailScreenState createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  String name, mobileno;

  getCustomerName(name) {
    this.name = name;
  }

  getCustomerMobileNo(mobileno) {
    this.mobileno = mobileno;
  }

  int _myCustomerType = 0;
  String detailVal;
  void _handleCustomerType(int value) {
    setState(() {
      _myCustomerType = value;
      switch (_myCustomerType) {
        case 1:
          detailVal = 'reseller';
          break;
        case 2:
          detailVal = 'consumer';
          break;
      }
    });
  }

  final databaseReference = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // var root = MaterialPageRoute(builder: (context) => new Dashboard());
              // Navigator.pushReplacement(context, root);
            }),
        actions: [
          PopupMenuButton<Choice>(
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
        title: Text("Customer"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // _myAppBar(),
            Container(
              //   width: MediaQuery.of(context).size.width,
              //  height: MediaQuery.of(context).size.height - 80,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Select Customer Type:',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _myCustomerType,

                            // onChanged: _handleCustomerType,
                            onChanged: (_handleCustomerType) {
                              getCustomerName(_handleCustomerType);
                            },
                            activeColor: Color(0xFF2196F3),
                          ),
                          Text(
                            'Reseller',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          // ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          SizedBox(
                            width: 20.0,
                          ),
                          //  children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: _myCustomerType,
                            onChanged: _handleCustomerType,
                            activeColor: Color(0xFF2196F3),
                          ),
                          Text(
                            'Consumer',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      // controller: _customerNameController,
                      onChanged: (String name) {
                        getCustomerName(name);
                      },
                      decoration: InputDecoration(labelText: "Name: "),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      //controller: _customerMobilenumberController,
                      onChanged: (String mobileno) {
                        getCustomerMobileNo(mobileno);
                      },
                      decoration: InputDecoration(labelText: "Mobile Number: "),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // This button is used to fro adding the details to the database
                      RaisedButton(
                          color: Colors.lightBlue,
                          onPressed: () {
                            createRecord();
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void createRecord() async {
    await databaseReference
        .collection("Cusomter Registration")
        .document("1")
        .setData(
            {'name': name, 'mobileno': mobileno, 'cutomertype': detailVal});
  }

  Widget popUp() {
    return AlertDialog(
      title: Text('Save'),
      content: const Text('Are You Sure ?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {},
        ),
      ],
    );
  }
}
