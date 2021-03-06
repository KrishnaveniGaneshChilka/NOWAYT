import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nowayt_copy1/User_dashboardProductBoxLayout.dart';
import 'package:firebase_database/firebase_database.dart';


class dashboard_airport extends StatefulWidget {

  @override
  _dashboard_airportState createState() => _dashboard_airportState();
}

class _dashboard_airportState extends State<dashboard_airport> {
  @override

    Query _airportreference;

    @override
    void initState() {
      _airportreference =
          FirebaseDatabase.instance.reference().child("Airport").orderByChild(
              "Name");
    }

    Widget _buildairportsrestaurantitem({Map airrestro}) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        padding: EdgeInsets.all(5),
        height: 100,
        child: ListView(

          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          children: <Widget>[
            RaisedButton(
              textColor: Colors.black,
              //textColor: Colors.white,
              color: Colors.white,
              child: ProductBox(
                  name: airrestro['Name'],
                  city: airrestro['City'],
                  price: 1000,
                  image: "food.png"
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MaterialApp()),
                );
              },
            ),


          ],


        ),


      );
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body:

          Container(
              child: FirebaseAnimatedList(query: _airportreference,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double>animation, int index) {
                    Map airrestro = snapshot.value;
                    return _buildairportsrestaurantitem(airrestro: airrestro);
                  })


          )


      ); //]



  }


}
