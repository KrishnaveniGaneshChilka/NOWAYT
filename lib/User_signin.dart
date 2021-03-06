import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nowayt_copy1/User_signup.dart';
import 'package:nowayt_copy1/User_afterlogindashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';



class User_login extends StatefulWidget {
  @override
  _User_loginState createState() => _User_loginState();
}

class _User_loginState extends State<User_login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final referenceDatabase = FirebaseDatabase.instance.reference().child("customers");
  _User_loginState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NOWAYT'),

        ),

        body:
        Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),

                  child: Lottie.asset("assets/signin.json"),
                  width:200,
                  height: 200,
                ),


                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 30),
                      // textColor: Colors.blue,
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(

                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter Your Email Here...',
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Enter Your Password Here...'
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgot()),
                    );*/
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Login'),
                        onPressed: () async {
                          var mail=nameController.text;
                          var pass=passwordController.text;
                          if(mail.isEmpty || pass.isEmpty)
                          {
                            Fluttertoast.showToast(
                                msg: "Enter Data!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.black,
                                fontSize: 16.0
                            );
                          }
                          else {
                            SharedPreferences pref_username= await SharedPreferences.getInstance();
                            pref_username.setString("Username", mail);
                            login_user(mail, pass);
                          }
                        }



                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => user_register()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),

              ],
            ))

    );
  }


  void login_user(var mail,var pass) {
    if(mail.isNotEmpty && pass.isNotEmpty) {
      referenceDatabase.once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, values) {
          try {
            if (mail == values["E-mail"]) {
              if (pass == values["Password"]) {
                Fluttertoast.showToast(
                    msg: "Login Sucessful!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.lightBlueAccent,
                    textColor: Colors.black,
                    fontSize: 16.0

                );
                String username_in;
                username_in=nameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => user_maindashboard(username: username_in)),
                );

              }
              else {
                Fluttertoast.showToast(
                    msg: "Incorrect Password",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.black,
                    fontSize: 16.0
                );
              }
            }
          }
          catch(ae) {
            Fluttertoast.showToast(
                msg: "Incorrect Username",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.black,
                fontSize: 16.0
            );
          }
        });
      });
    }
  }
  }

