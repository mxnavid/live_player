import 'package:flutter/material.dart';


class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              FlatButton(
                child: Text("New User"),
                textColor: Colors.red,
                onPressed: (){},

              ),
              FlatButton(
                child: Text("Returning User"),
                textColor: Colors.green,
                onPressed: (){},
              )
            ],
          )
        ),
      ),
    );
  }
}