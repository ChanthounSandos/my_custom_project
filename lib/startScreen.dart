import 'package:flutter/material.dart';
import 'package:my_custom_project/loginScreen.dart';
import 'package:my_custom_project/signUpScreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/startimg.png"),
                  fit: BoxFit.fill,
                ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text("HELLO", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                Text("Welcome to application", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 550,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16),),
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(0, 105, 148, 1)),
                  )
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                        },
                        child: Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 16),)
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
