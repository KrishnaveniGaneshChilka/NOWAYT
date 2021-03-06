import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nowayt_copy1/User_dashboardProductBoxLayout.dart';
import 'package:nowayt_copy1/menu_mall_restro.dart';

class dashboard_malls extends StatefulWidget {
  @override
  _dashboard_mallsState createState() => _dashboard_mallsState();
}

class _dashboard_mallsState extends State<dashboard_malls> {
  final referenceDatabase = FirebaseDatabase.instance.reference().child("Restaurants/Mall_Restaurants");
  //Query _mallsreference,mallref1;


  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //mallref1=FirebaseDatabase.instance.reference().child("Restaurants/Mall_Restaurants");
    //_mallsreference=mallref1.orderByChild("ID");


  }*/


  Widget _buildmallsrestaurantitem({Map mallsrestro}){



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
                  name: mallsrestro['NAME'],
                  city: mallsrestro['CITY'],
                  price: 1000,
                  image: "food.png"
              ),
              onPressed: () {
                int id=mallsrestro['ID'];
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => menu_mall(restroid: id)),
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
            child:FirebaseAnimatedList(query:referenceDatabase, itemBuilder:(BuildContext context,DataSnapshot snapshot,
                Animation<double>animation,int index){
              Map mallsrestro=snapshot.value;
              return _buildmallsrestaurantitem(mallsrestro : mallsrestro);

            } )





        )






    );     //]



  }
}




