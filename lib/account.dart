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


//TODO: New User's form needs to be implemented in stateful
class NewUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ListView(

          children: <Widget>[
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'
              ),

            )
          ],
        ),
      ),
    );
  }
}

class ExistingUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ListView(

          children: <Widget>[
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'
              ),

            )
          ],
        ),
      ),
    );
  }
}