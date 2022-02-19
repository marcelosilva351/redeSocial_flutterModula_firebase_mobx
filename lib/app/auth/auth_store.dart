import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rede_social/app/repositories/auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {
  var controllerEmail = TextEditingController();
  var controllerSenha = TextEditingController();
  var authRepository = AuthRepository();

  logout() async{
    await authRepository.logoutUser();

  }

  @observable
  String stringResultLogar = '';

  @action
  resultLogin() async{
    var email = controllerEmail.text;
    var senha = controllerSenha.text;
    if(email == '' || senha == ''){
      stringResultLogar = 'Digite todos os campos';
      return;
    }
    if(!email.contains('@') && !email.contains('.com')){
      stringResultLogar = 'Digite um email valido';
      return;
    }
    if(senha.length < 5){
      stringResultLogar = 'Sua senha precisa ser maior do que 6 caracteres';
      return;
    }
    stringResultLogar = '';
    try{
    await authRepository.loginUser(email, senha);
    stringResultLogar = 'Aguarde';
    Modular.to.pushNamed('/home/');

    }on FirebaseAuthException catch(erro){
      if(erro.code == 'user-not-found'){
        stringResultLogar = 'Não existe nenhum usuario com este email';
      }
      if(erro.code == 'wrong-password'){
        stringResultLogar = 'Senha incorreta';
      }
      
    }
   

    
  }

}