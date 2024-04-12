import 'package:flutter/material.dart';
import 'package:my_custom_project/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.white,fontFamily: "EagleLake"),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 105, 148, 1),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(0, 105, 148, 2),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 105, 148, 2),
              ),
              accountName: Text("Sandos Chanthoun"),
              accountEmail: Text("@chanthoun_sandos"),
              currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.mode_night_outlined, color: Colors.white,),
              title: Text("Theme", style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.group, color: Colors.white,),
              title: Text("Group", style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white,),
              title: Text("Settings", style: TextStyle(color: Colors.white),),
              onTap: (){
                alert_setting(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined, color: Colors.white,),
              title: Text("Send Feedback", style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined, color: Colors.red,),
              title: Text("LogOut", style: TextStyle(color: Colors.red),),
              onTap: (){
                alert_logout(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 190,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1), right: BorderSide(width: 1), left: BorderSide(width: 1)),
                        boxShadow: [BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2)]
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage("images/musics.png")),
                          Text("Music")
                        ],
                      ),
                    ),
                    Container(
                      width: 190,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1), right: BorderSide(width: 1), left: BorderSide(width: 1)),
                        boxShadow: [BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2)]
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage("images/sport.png")),
                          Text("Music")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 190,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1), right: BorderSide(width: 1), left: BorderSide(width: 1)),
                          boxShadow: [BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2)]
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage("images/musics.png")),
                          Text("Music")
                        ],
                      ),
                    ),
                    Container(
                      width: 190,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1), right: BorderSide(width: 1), left: BorderSide(width: 1)),
                          boxShadow: [BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2)]
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage("images/musics.png")),
                          Text("Music")
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void alert_logout(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Color.fromRGBO(0, 105, 148, 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("Log Out?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        content: Text("Are you sure you want to logout?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel", style: TextStyle(color: Colors.white),)),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }, child: Text("Log Out", style: TextStyle(color: Colors.red),)),
        ],
      );
    });
  }

  alert_setting(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Color.fromRGBO(0, 105, 148, 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text("Settings", style: TextStyle(color: Colors.white),),
        content: Column(
          children: [

          ],
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Close", style: TextStyle(color: Colors.white),)),
        ],
      );
    });
  }
  
}
