import 'package:flutter/material.dart';
import 'package:flutterauth/main.dart';

// Widget
import 'package:flutterauth/screens/login.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// Redux
import "./types.dart";

Future<void> switchAuth() async {
  store.dispatch(Types.switchauthtype);
}

Future<void> register(
    {required BuildContext context, name, email, password}) async {
  if (name == "" || email == "" || password == "") {
    return store.dispatch(UpdateErrorAction("Please fill all fields"));
  }

  // Create a user collection
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  try {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredentials) => {
              // Store user & Redirect

  } catch (err) {
    store.dispatch(UpdateErrorAction(err.toString()));
  }
}

Future<void> login({required BuildContext context, email, password}) async {
  if (email == "" || password == "") {
    return store.dispatch(UpdateErrorAction("Please fill all fields"));
  }

  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    store.dispatch(UpdateErrorAction(""));
    print("``````````````````logged in``````````````````");

  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
    } else if (e.code == "wrong-password") {
      return store
          .dispatch(UpdateErrorAction("wrong credentials for this user"));
    }
  }
}
