import 'package:flutter/material.dart';
import 'package:my_custom_project/homeScreen.dart';
import 'package:my_custom_project/signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  late String email;
  late String pwd;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var emailcontroller = new TextEditingController();
  var pwdcontroller = new TextEditingController();
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
          ListView(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 40, left: 0, right: 0),
                // top: 100,
                // left: 0,
                // right: 0,
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image(image: AssetImage("images/signin.png"), width: 120,),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Welcome Back", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "EagleLake"),),
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
                                    await doSignIn(context);
                                  },
                                  child: Text("Sign In", style: TextStyle(color: Colors.white),),
                                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(0, 105, 148, 1)),
                                )
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have any account?"),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                                  }, child: Text("Sign Up"))
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
        ],
      ),
    );
  }

  Future<void> doSignIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pwd);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      emailcontroller.clear();
      pwdcontroller.clear();
    } on FirebaseAuthException catch(e) {
      alert_fail(context, e.message ?? "");
    }
  }

  void alert_fail(BuildContext context, String message){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Icon(Icons.error, color: Colors.red, size: 50,),
          ],
        ),
        content: Text(message, textAlign: TextAlign.center),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ok")
          )
        ],
      );
    });
  }

}
