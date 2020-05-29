import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn =GoogleSignIn();
  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  final _formKey=GlobalKey<FormState>();
  SharedPreferences preferences;
  bool loading=false;
  bool isLogedin=false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }
  void isSignedIn() async{
    setState(() {
      loading=true;
    });

    preferences=await SharedPreferences.getInstance();
    isLogedin=await googleSignIn.isSignedIn();
    if(isLogedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
    setState(() {
      loading=false;
    });
  }

  Future handleSignIn()async{
    preferences=await SharedPreferences.getInstance();

    setState(() {
      loading=true;
    });
    GoogleSignInAccount googleUser=await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication=await googleUser.authentication;
    //FirebaseUser firebaseUser=await firebaseAuth.signInWithGoogle(
    // idToken:googleSignInAuthenticaton.idToken,accessToken:googleSignInAuthentication.accessToken);
   // =============================================================25.   6:55

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset('images/1.jpg',fit: BoxFit.cover,width: double.infinity,
          ),
//          Container(
//            alignment: Alignment.topCenter,
//            child: Image.asset("images/1.jpg",width: 150,height: 150,),
//          )
        Container(
          alignment: Alignment.center,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[

                ],
              ),
            ),
          ),
        ),

          Visibility(
            visible: loading??true,
            child: Center(

              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
            child: FlatButton(
              color: Colors.red,
              onPressed: (){
                handleSignIn();
              }, child: Text('Sign In/Sign up with Google',style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
