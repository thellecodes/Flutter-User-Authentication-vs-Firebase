import 'package:flutter/material.dart';

// screens
import 'package:flutterauth/screens/login.dart';
import 'package:flutterauth/screens/register.dart';

// redux
import 'package:flutter_redux/flutter_redux.dart';
import '../store/reducer.dart';

class AuthLogic extends StatefulWidget {
  const AuthLogic({Key? key}) : super(key: key);

  @override
  _AuthLogic createState() => _AuthLogic();
}

class _AuthLogic extends State<AuthLogic> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xffF7B43D),
            body: Center(
                child: Container(
                    decoration: const BoxDecoration(color: Color(0xffF7B43D)),
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          StoreConnector<AppState, bool>(
                              converter: (store) => store.state.authType,
                              onWillChange: (prev, next) {},
                              builder: (_, authType) {
                                return Container(
                                    width: screenWidth * 0.45,
                                    height: screenHeight * 0.65,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                            color: const Color(0xff020202),
                                            width: 9)),
                                    alignment: Alignment.center,
                                    child: authType
                                        ? const Login()
                                        : const Register());
                              }),
                          Positioned(
                              top: -30.0,
                              child: SizedBox(
                                child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: const BoxDecoration(
                                      color: Color(0xff2DAAE1),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      "Flutter Firebase App",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              )),
                        ])))));
  }
}
