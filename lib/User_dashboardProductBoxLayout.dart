import 'package:flutter/material.dart';
import 'package:nowayt_copy1/User_dashboardMallrestro.dart';

class ProductBox extends StatelessWidget {
  ProductBox( {Key key,this.name, this.city, this.price, this.image}) :
        super(key:key);
  final String name;
  final String city;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 80,
        //child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Image.asset("assets/Images/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                              this.name, style: TextStyle(
                              fontWeight: FontWeight.bold
                          )
                          ),
                          Text(this.city), Text(
                              "Price: " + this.price.toString()
                          ),
                        ],
                      )
                  )
              )
            ]
        )
      //)
    );
  }
}