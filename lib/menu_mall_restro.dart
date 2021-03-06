import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nowayt_copy1/menu_itemModel.dart';
import 'package:nowayt_copy1/menu_tabscreen_cartscreen.dart';
import 'package:nowayt_copy1/menu_tabscreen_menuscreen.dart';

class menu_mall extends StatefulWidget {
  int restroid;
  menu_mall({Key key , @required this.restroid}):super(key:key);

  @override
  _menu_mallState createState() => _menu_mallState(restroid);
}


class _menu_mallState extends State<menu_mall> {
  final mall_reference = FirebaseDatabase.instance.reference().child(
      "Restaurants/Mall_Restaurants");
  List<ItemModel> final_cart=[];
  double sum=0;
  int restroid;
  _menu_mallState(this.restroid);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showmenu();
  }

  void showmenu() {
    String menu1;
    mall_reference.once().then((DataSnapshot datasnapshot) {
      Map <dynamic, dynamic> values = datasnapshot.value;
      values.forEach((key, value) {
        try {
          print(
              '*********************************************************************************');
          //print(restroid);
          if (restroid== value["ID"]) {
            print("Im on right path");
            menu1 = value["MENU1"];
            String menu2 = value["MENU2"];
            String menu1_type = value["TYPE1"];
            String menu2_type = value["TYPE1"];
            //restaurant_data restaurant_data1=new restaurant_data(value["TYPE1"],value["MENU1"],value["TYPE2"],value["MENU2"]);
            print(restroid);

            print(menu1_type);
            print(menu1);
            print(menu2_type);
            print(menu2);

          }
        }
        catch (ae) {
          Fluttertoast.showToast(
              msg: "error into id block!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.lightBlueAccent,
              textColor: Colors.black,
              fontSize: 16.0

          );
        }
      });
    });

    //Fluttertoast.showToast(msg: "This is sHowMenu");

  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart App"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Menu",),
              Tab(text: "Cart",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            menu_screen((selectedProduct){
              setState(() {
                final_cart.add(selectedProduct);//update
                sum = 0;
                final_cart.forEach((item){
                  sum = sum + item.price;
                });
              });
            }),

            cart_checkout(final_cart, sum),
          ],
        ),
      ),
    );


  }
}












