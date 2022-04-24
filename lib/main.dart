import 'package:flutter/material.dart';
import 'package:flutterauth/screens/login.dart';

// Firebase Core
import 'package:firebase_core/firebase_core.dart';

// Redux Core
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutterauth/store/reducer.dart';

// screens
import "package:flutterauth/screens/authlogic.dart";

// Create Redux Store
final store = Store<AppState>(reducers,
    initialState: AppState(authType: false, errMsg: ""),
    middleware: [thunkMiddleware]);

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        options: const FirebaseOptions(
            apiKey: "",
            authDomain: "",
            databaseURL: "",
            projectId: "",
            storageBucket: "",
            messagingSenderId: "",
            appId: "",
            measurementId: ""));
  } catch (err) {
    print(err);
  }

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  // Add the state
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            initialRoute: "authentication",
            routes: {
              "authentication": (BuildContext context) => const 
            },
            home: const SafeArea(child: Scaffold())));
  }
}
