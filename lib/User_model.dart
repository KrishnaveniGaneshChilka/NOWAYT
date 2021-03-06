//import 'dart:convert';

class User {
  String user_id;
  final String password;
  final String email;
  final String contact;
  final String full_name;
  final String address;
  final String location;
  int order_number;

  User(this.user_id,this.email,this.password,this.contact,this.full_name,this.address,this.location,this.order_number);

  /*User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];
        //contact=json['contact_number'];*/





  Map<String, dynamic> toJson() =>
      {
        'id':user_id,
        'email': email ,
        'password': password,
        'contact' : contact,
        'Full_name':full_name,
        'address':address,
        'city':location,
        'order_number':order_number,
      };
}
