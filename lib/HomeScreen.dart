import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomerList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                    child: Text('Customer List'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      var root = MaterialPageRoute(
                          builder: (context) => CustomerList());
                      Navigator.pushReplacement(context, root);
                    }),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                    child: Text('Orders List'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // var root =
                      //     MaterialPageRoute(builder: (context) => OrdersList());
                      // Navigator.pushReplacement(context, root);
                    }),
              ],
            ),
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                      child: Text('Orders Details'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        // var root = MaterialPageRoute(
                        //     builder: (context) => OrderDetail());
                        // Navigator.pushReplacement(context, root);
                      }),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                      child: Text('Customer History'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        // var root = MaterialPageRoute(
                        //     builder: (context) => CustomerHistory());
                        // Navigator.pushReplacement(context, root);
                      }),
                ]),
                RaisedButton(
                    child: Text('Receive Payment'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // var root = MaterialPageRoute(
                      //     builder: (context) => ReceivePayment());
                      // Navigator.pushReplacement(context, root);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
