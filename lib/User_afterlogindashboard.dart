import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:nowayt_copy1/GoogleMap.dart';
import 'package:nowayt_copy1/User_dashboardMallrestro.dart' as second;
import 'User_dashboardAirportrestro.dart' as third;
import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

String addr1="";
String addr2="";


class user_maindashboard extends StatefulWidget {
  String username;
  user_maindashboard({Key key , @required this.username}):super(key:key);
  @override
  _user_maindashboardState createState() => _user_maindashboardState(username);
}

class _user_maindashboardState extends State<user_maindashboard> {
  String latitude="";
  String longitude="";

String username;
_user_maindashboardState(this.username);


  @override
  void initState(){
    super.initState();

    _getCurrentLocation();
    //_getaddress();
  }

  _getCurrentLocation()async{
    //final geoposition=await Geolocation().getCurrentPosition(desiredAccuracy : LocationAccuracy.high);
    final  position= await Geolocator.getCurrentPosition();
    setState(() {
      latitude='${position.latitude}';
      longitude='${position.longitude}';

    });
    final coordinates=new Coordinates(position.latitude,position.longitude);
    var addresses=await Geocoder.local.findAddressesFromCoordinates(coordinates);
    //var first=addresses.first;
    setState(() {
      addr1='${addresses.first.locality}';
      addr2='${addresses.first.subLocality}';
      print("***************************");
      print(addr1);
      print(addr2);
    });

  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,

        child:  Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(top:5.0),
              child: basicappbar(),
             // child: searchbar(),
            ),

            //title: const Text('Dashboard'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),



          drawer: new Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'Your Account',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 25),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('asset/coffee.gif')
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.input),
                  title: Text('Welcome'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MaterialApp()),
                    );

                  },
                ),
                ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('Profile'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.border_color),
                  title: Text('Feedback'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
              ],
            ),
          ),
          body:
          new TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),

          //new Center(child: _widgetOptions.elementAt(_selectedIndex),),

         /* bottomNavigationBar: BottomNavigationBar(
            //Center(child: _widgetOptions.elementAt(_selectedIndex),),
            type: BottomNavigationBarType.fixed,
            //currentIndex: _currentIndex,
            //currentIndex: model.currentIndex,
            //onTap: onTabTapped,

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text('Search')
                //actions: [searchBar.getSearchAction(context)],
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_location), title: Text('Location')),
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), title: Text('Profile')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz), title: Text('More')),

            ],
            /*onTap: (Index){
              setState(()
              {
                _currentIndex = index;
              });
            }*/
            //currentIndex: _selectedIndex,
            //selectedItemColor: Colors.amber[800],
            //onTap: _onItemTapped,
          ),
*/
        ),
      ),
    );
  }


}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'All', icon: Icons.home),
  Choice(title: 'Restaurant', icon: Icons.restaurant),
  Choice(title: 'Airport', icon: Icons.local_airport),
  Choice(title: 'Medical', icon: Icons.local_hospital),
  Choice(title: 'Food', icon: Icons.fastfood),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;
  // TabController controller;
  @override
  Widget build(BuildContext context) {
   // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      //color: Colors.white,
      child: Center(
        child: TabBarView(
          children: <Widget>[
            new second.dashboard_malls(),
            new second.dashboard_malls(),
            new third.dashboard_airport(),
            new second.dashboard_malls(),
            new second.dashboard_malls(),

          ],
        ),
      ),
    );
  }
}

Widget basicappbar(){

  return Container(
   // padding: EdgeInsets.all(10),
    //height: 80,
    color: Colors.white,
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        /*Container(
          child: IconButton(
            icon: Icon(Icons.menu,size: 30.0,color: Colors.black,),
          ),
        ),*/
        Container(
          child: FlatButton.icon(onPressed:null
          ,icon:Icon(Icons.location_on,color: Colors.black,), label:Text(addr2+","+addr1,style: TextStyle(color:Colors.black,fontSize: 20.0),))

        ),
        /*Container(
          child: IconButton(
              icon: Icon(
                Icons.save,
                size: 30.0,
                color: Colors.black,
              ),
              onPressed: null ),
        ),*/
      ],
    ),



  );
  /*return Scaffold(
    appBar: PreferredSize(child: SafeArea(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.notifications,size: 30.0,),
            FlatButton.icon(onPressed:null ,icon:Icon(Icons.location_on,color: Colors.black,), label:Text(addr2+","+addr1,style: TextStyle(color:Colors.black,fontSize: 20.0),)),
            Icon(Icons.save,size: 30.0,)
          ],
        ),

      ),
    ),

      preferredSize:Size.fromHeight(100),

    ),
  );*/

}

Widget searchbar(){
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(Icons.save),
          ),
        ),
        Container(
          child: Text(
            'Google Play',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.blueGrey,
              ),
              onPressed: null),
        ),
      ],
    ),
  );
}











