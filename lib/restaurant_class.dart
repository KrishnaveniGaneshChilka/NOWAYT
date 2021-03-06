class restaurant_data {
  //String user_id;
  final String type1;
  final String menu1;
  final String type2;
  final String menu2;
  /*final String address;
  final String location;*/

  restaurant_data(this.type1,this.menu1, this.type2, this.menu2);

  /*User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];
        //contact=json['contact_number'];*/





  Map<String, dynamic> toJson() =>
      {
        'type1': type1,
        'item1': menu1,
        'type2': type2,
        'item2': menu2
      };
}


