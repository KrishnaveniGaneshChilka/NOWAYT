import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'menu_itemModel.dart';

class menu_screen extends StatelessWidget {

  final ValueSetter<ItemModel>_valueSetter;
  menu_screen(this._valueSetter);




  List<ItemModel> products = [
    ItemModel("fried Rice", 50),
    ItemModel("Mnchurian Gravy", 100),
    ItemModel("Misal", 55),
    ItemModel("Thalipeeth", 10),
    ItemModel("Batata Puri", 50),
    ItemModel("Samosa", 30),
    ItemModel("Dosa (Butter)", 50),
    ItemModel("Sambar Rice", 100),
    ItemModel("Dal Mkhani", 55),
    ItemModel("Veg Pulav ", 10),
    ItemModel("Pinapple Raita", 50),
    ItemModel("Shahi Paneer", 30),
  ];







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].name),
              trailing: Text("Rs.${products[index].price}", style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),),
              onTap: () {

                _valueSetter(products[index]);

              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: products.length
      ),
    );
  }
}

