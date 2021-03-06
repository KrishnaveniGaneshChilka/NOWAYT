import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nowayt_copy1/menu_itemModel.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class order_details extends StatefulWidget {
  @override
  _order_detailsState createState() => _order_detailsState();
}

class _order_detailsState extends State<order_details> {

  String Username = "";
  var cart1;

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      print("****************");
      Username = prefs.getString('Username');
      cart1 = json.decode(prefs.getString("cart1"));
    });
    print(cart1);
  }


  // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*ListView.separated(
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(cart1[index].name),
                  trailing: Text("Rs.${cart1[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),

                ) ;
              },
              separatorBuilder: (context, index){
                return Divider();
              },
              itemCount: cart1.length,
              shrinkWrap: true,

            ),*/
            QrImage(
              //plce where the QR Image will be shown
                data: Username
            ),
            SizedBox(
              height: 40.0,
            ),


          ],
        ),
      ),
    );
  }
}
