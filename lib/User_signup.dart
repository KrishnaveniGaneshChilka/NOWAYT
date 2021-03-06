import 'package:nowayt_copy1/User_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class user_register extends StatefulWidget {
  @override
  _user_registerState createState() => _user_registerState();
}

class _user_registerState extends State<user_register> {
  final referenceDatabase = FirebaseDatabase.instance;
  var email="";
  var password="";
  var contact="";
  var user_id="";
  var fullname="";
  var address="";
  var loaction="";
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final ref=referenceDatabase.reference().child("customers");
    return Scaffold(
      appBar: AppBar(
        title: Text("NOWAYT"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:
      Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            //autovalidate: true,
            key: _formKey,
            child: ListView(

                children: <Widget>[


                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),

                    child: Lottie.asset("assets/signup.json")
                    ,width: 200,height: 200,
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 30),
                        // textColor: Colors.blue,
                      )),

                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged:(value) {
                        setState(() {
                          fullname = value;
                        });
                      },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter Your Full Name',
                      ),
                    ),
                  ),

                  //SizedBox(width: 100,
                  // height: 30.0, ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      // controller: nameController,
                      onChanged: (val){
                        setState(() {
                          email=val;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if(!isEmail(val))
                        {
                          return 'Invalid Email-ID';
                        }


                        return null;
                      },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.grey,
                        ),),
                        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Enter Your Email Here...',
                        //labelText: 'Enter E-mail ID',
                      ),

                    ),
                  ),

                  Container(
                    //SizedBox(height: 20.0),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          password=val;
                        });

                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter some text';
                        }
                        /*else if(val.length<4)
                    {
                      return 'Enter 4-digit Password';
                    }*/
                        return null;
                      },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Enter Your Password Here',
                        //labelText: 'Enter Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                  // SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if(value!=password)
                        {
                          return 'Password Doesnt Match';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Confirm Your Password Here',
                      ),
                      obscureText: true,
                    ),
                  ),
                  //SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      onChanged:(value) {
                        setState(() {
                          contact=value;
                        });

                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter contact number';
                        }
                        else if(value.length!=10)
                        {
                          return 'Please Enter correct contact number';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Enter Your Contact Number...',
                        //labelText: 'Enter Contact Number',
                      )
                    ),
                  ),
                  //SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged:(value) {
                        setState(() {
                          address = value;
                        });
                      },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home),
                        hintText: 'Enter Your Address',
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged:(value) {
                        setState(() {
                          loaction = value;
                        });
                      },


                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_pin_circle),
                        hintText: 'Enter Your City',
                      ),
                    ),
                  ),


                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,

                        onPressed: (){
                          if (_formKey.currentState.validate()) {
                            user_id=ref.push().key;
                            User user=new User(user_id,email, password,contact,fullname,address,loaction,0);
                            ref.child(user_id).set({
                              'E-mail':user.email,
                              'Password':user.password,
                              'Contact Number':user.contact,
                              'Full name':user.full_name,
                              'city':user.location,
                              'address':user.address,
                              'Order_number':0
                              //'Contact':user.contact

                            });
                            Fluttertoast.showToast(
                                msg: "Registered Sucessfully!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.lightBlueAccent,
                                textColor: Colors.black,
                                fontSize: 16.0
                            );

                          }
                        },
                        child: Text('Register'),
                      )   )    ,
                ]
            ),
          )
      ),
    );

  }//main widget

  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }



}//state
