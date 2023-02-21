import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel{


  Future login(String emailAddress, String password ) async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailAddress,
  password: password
  );
  final user = credential.user;
  return user;
  } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
  print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                print('Wrong password provided for that user.');
  }
  }
}

}