import 'package:flutter/material.dart';
import 'package:pmtc_project/locator/locator.dart';
import 'package:pmtc_project/login/model/loginModel.dart';
import 'package:pmtc_project/login/services/login_services.dart';
import 'package:pmtc_project/screens/home.dart';
import 'package:pmtc_project/login/view_models/login_viewModels.dart';
import 'package:pmtc_project/login/view_models/login_viewModels.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginViewModel loginViewModel = LoginViewModel();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            Padding(
              padding: EdgeInsets.only(top: 75, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('Images/pertamina_logo.png'),
                  Center(
                    child: Text("Maritime Training Centre",
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Center(
                        child: Text(
                      "Masuk",
                      style: TextStyle(fontSize: 18),
                    )),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                      ),
                      Container(
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              labelText: "username",
                              hintText: "Masukkan username",
                              border: InputBorder.none,
                              icon: Icon(Icons.account_circle_rounded)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0.5)),
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 20, top: 10),
                      ),
                      Text("Password"),
                      Container(
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "password",
                            icon: Icon(Icons.lock),
                            hintText: "Masukkan password",
                            border: InputBorder.none,
                          ),
                          obscureText: true,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0.5)),
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(top: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      usernameController.clear();
                      passwordController.clear();
                    },
                    child: Text("Cancel"),
                    style: TextButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0))))),
                ElevatedButton(
                    onPressed: () {
                      final test = loginViewModel.login(
                          usernameController.text, passwordController.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    },
                    child: Text("Masuk")),
              ],
            )
          ],
        ),
      ),
    );
  }
  //  Future<User?> signInUsingEmailPassword({required String email, required String password, required BuildContext context})async{
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try{
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  //     user = userCredential.user;
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  //   }on FirebaseAuthException catch(e){
  //     if(e.code=="user-not-found"){
  //       print("No user found for that email");
  //     }
  //   }
  //   return user;
  // }
}