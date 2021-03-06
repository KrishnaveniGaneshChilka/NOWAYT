import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nowayt_copy1/User_dashboardProductBoxLayout.dart';
import 'package:firebase_database/firebase_database.dart';

class dashboard_all extends StatefulWidget {
  const dashboard_all({ Key key }) : super(key: key);
  @override
  _dashboard_allState createState() => _dashboard_allState();
}

class _dashboard_allState extends State<dashboard_all> {
  @override

    Query _allreference1;


    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _allreference1 =
          FirebaseDatabase.instance.reference().orderByChild(
              "Name");
    }


    Widget _buildallitem({Map restro}) {
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
                  name: restro['Name'],
                  city: restro['City'],
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
              child: FirebaseAnimatedList(query: _allreference1,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double>animation, int index) {
                    Map restro = snapshot.value;
                    return _buildallitem(restro:restro);
                  })


          )


      ); //]


    }

  }

