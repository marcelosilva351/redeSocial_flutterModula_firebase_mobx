import 'package:firebase_auth/firebase_auth.dart';


class AuthRepository{

  var auth = FirebaseAuth.instance;

  Future<String> loginUser(String email, String senha) async{
  
  return await auth.signInWithEmailAndPassword(email: email, password: senha).then((value) {return 'logado';});





  }


  Future<String> logoutUser() async{
    return await auth.signOut().then((value) => 'deslogado').catchError((erro) { return 'erro';});
  }





}