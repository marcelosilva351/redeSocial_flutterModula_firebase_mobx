import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
abstract class _HomeStoreBase with Store {

  @observable
  String userPhotoUrl = '';
  @action
  void increment() {
  } 


  @action
  getUserPhoto(String email)async {
   var photo = FirebaseStorage.instance;
   try{
    var foto=    await photo.ref('user/$email').getDownloadURL();
    userPhotoUrl = foto;


   }on FirebaseException catch( erro){
     if(erro.code == 'object-not-found'){
       userPhotoUrl = '';
       print(erro);
     }
     
   }
  }

  @action 
  changeFoto(String email) async{
  final XFile? image = await ImagePicker.platform.getImage(source: ImageSource.gallery);
  var photo = FirebaseStorage.instance;
  if(image != null)
  {
  await photo.ref('user/$email').putFile(File(image.path));
  getUserPhoto(email);

  }



 
  }
}