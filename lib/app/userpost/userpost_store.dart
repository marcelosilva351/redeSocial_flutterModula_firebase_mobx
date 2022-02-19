import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rede_social/app/repositories/post_repository.dart';
import 'package:rede_social/core/models/post_model.dart';

part 'userpost_store.g.dart';

class UserpostStore = _UserpostStoreBase with _$UserpostStore;
abstract class _UserpostStoreBase with Store {
  var postRepository = PostRepository();
  var controllerTituloPost = TextEditingController();
  var controllerConteudoPost = TextEditingController();
  var controllerTituloPostEdit = TextEditingController();
  var controllerConteudoPostEdit = TextEditingController();
  var emailUser = '';
  @observable
  String stringResultCriarPost = '';
  

  @observable
  ObservableFuture<List<PostModel>>? postsUser;

  @action
  getPosts(String email){
    postsUser = ObservableFuture(postRepository.getUserPosts(email));
  }

  
  void getPostsFromMobxWidget(){
    postsUser = ObservableFuture(postRepository.getUserPosts(emailUser));
  }

 String getUserPhoto(String email) {
   var photo = FirebaseStorage.instance;
   try{
    var foto=    photo.ref('user/$email').getDownloadURL();
    return foto.toString();


   }on FirebaseException catch( erro){
     if(erro.code == 'object-not-found'){
       return '';
     }
     
   }
   return '';
  }
  
  @action
  editPost(String code, String email) async{
    if(controllerConteudoPostEdit.text == '' || controllerTituloPostEdit.text == ''){
      return false;
    }
  var postEdit = PostModel(code, email, controllerTituloPostEdit.text, controllerConteudoPostEdit.text);

    await postRepository.editarPost(postEdit);
    getPosts(email);
    return true;



  }
  
  @action
  excluirPost(String code, String email) async{
    var result = await postRepository.excluir(code);
    if(result){
      getPosts(email);
    }


  }
  @action
  Future<bool> addPost(String emailUser) async{
     var titulo = controllerTituloPost.text;
     var conteudo = controllerConteudoPost.text;
     if(titulo == '' || conteudo == ''){
       stringResultCriarPost = 'Digite todos os campos';
       return false;
     }
     var postAdd = PostModel(null,emailUser, titulo, conteudo);
     var result = await postRepository.addPostUser(postAdd);
     if(result){
       controllerConteudoPost.text = '';
       controllerTituloPost.text = '';
       stringResultCriarPost = '';
       getPosts(emailUser);
       return true;
     }
     stringResultCriarPost = 'Ocorreu um erro ao criar post';
     return false;

   }
}