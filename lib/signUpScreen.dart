import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_custom_project/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String email;
  late String pwd;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController pwdcontroller = new TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 350,
            color: Color.fromRGBO(0, 105, 148, 1),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 80, left: 0, right: 0),
            // top: 100,
            // left: 0,
            // right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Image(image: AssetImage("images/signup.png"), width: 100,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Registration", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2)]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailcontroller,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_sharp, color: Colors.grey,),
                          ),
                          onChanged: (value){
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: pwdcontroller,
                          obscureText: isVisible,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_sharp, color: Colors.grey,),
                            suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                            }, icon: isVisible?Icon(Icons.visibility):Icon(Icons.visibility_off))
                          ),
                          onChanged: (value){
                            pwd = value;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async{
                                final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pwd);
                                if(user == null){
                                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pwd);
                                  alert_success(context);
                                  // pwdcontroller.clear();
                                  // emailcontroller.clear();
                                } else if(user != null){
                                  alert_unsuccess(context);
                                }

                              },
                              child: Text("Sign Up", style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(0, 105, 148, 1)),
                            )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account?"),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            }, child: Text("Sign In"))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  void alert_success(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Icon(Icons.check_circle_outline_rounded, color: Colors.green, size: 50,),
            Text("Successfull")
          ],
        ),
      );
    });
  }
  void alert_unsuccess(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Icon(Icons.incomplete_circle, color: Colors.red, size: 50,),
            Text("This email is exist")
          ],
        ),
      );
    });
  }
}
