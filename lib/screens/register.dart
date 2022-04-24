import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterauth/store/actions/authActions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../main.dart';
import '../store/reducer.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _fullName = "";
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();

    // Disable persistance on web platforms
    FirebaseAuth.instance.setPersistence(Persistence.NONE);

    // check if user is logged in
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      if(user != null){
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SingleChildScrollView(
            child: Column(children: [
      //Display state error messages
      //* Error Msgs *//
      StoreConnector<AppState, String>(
          converter: (store) => store.state.errMsg,
          onWillChange: (prev, next) {},
          builder: (_, errMsg) {
            return Container(
              padding: const EdgeInsets.only(top: 34, bottom: 10),
              child: Text(
                errMsg,
                style: const TextStyle(color: Color(0xffff4500)),
              ),
            );
          }),
      Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 80.0, right: 80.0),
          child: SizedBox(
              width: 347.0,
              height: 57.0,
              child: TextField(
                onChanged: (String name) {
                  if (name != "") {
                    setState(() {
                      _fullName = name;
                    });
                  }
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xff2DAAE1),
                  hintText: 'Your Fullname',
                  hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal),
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textCapitalization: TextCapitalization.none,
              ))),
      Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 80.0, right: 80.0),
          child: SizedBox(
            // width: double.infinity,
            width: 347.0,
            height: 57.0,
            child: TextField(
              onChanged: (String email) {
                if (email != "") {
                  setState(() {
                    _email = email;
                  });
                }
              },
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xff2DAAE1),
                hintText: 'Your Email',
                hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal),
              ),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textCapitalization: TextCapitalization.none,
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 80.0, right: 80.0),
          child: SizedBox(
            width: 347.0,
            height: 57.0,
            child: TextField(
              obscureText: true,
              onChanged: (String password) {
                if (password != "") {
                  _password = password;
                }
              },
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xff2DAAE1),
                hintText: 'Your Password',
                hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal),
              ),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textCapitalization: TextCapitalization.none,
            ),
          )),
      Container(
        margin: const EdgeInsets.all(25),
        width: 228.0,
        height: 43.0,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black, // foreground
            backgroundColor: Colors.black,
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
          ),
          onPressed: () {
            store.dispatch(register(
                context: context,
                name: _fullName,
                email: _email,
                password: _password));
          },
          child: const Text(
            'Register',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),

      Container(
          margin: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    "Have an account?",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                    ),
                  )),
              TextButton(
                onPressed: () {
                  store.dispatch(switchAuth());
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ))
    ])));
  }
}
