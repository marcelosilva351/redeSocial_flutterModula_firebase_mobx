import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:rede_social/app/repositories/post_repository.dart';
import 'package:rede_social/core/models/post_model.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStoreBase with _$FeedStore;
abstract class _FeedStoreBase with Store {
  var postRepository = PostRepository();
  @observable
  ObservableFuture<List<PostModel>>? postsUser;

  @action
  getPosts(){
    postsUser = ObservableFuture(postRepository.getPosts());
  }
 
  @observable 
  String urlImage = '';
  
  void getPostsFromMobxWidget(){
    postsUser = ObservableFuture(postRepository.getPosts());
  }
 
  Future<String>getUserPhoto(String email)async {
   var photo = FirebaseStorage.instance;
   try{
    return  photo.ref('user/$email').getDownloadURL();
    
   }on FirebaseException catch( erro){
     if(erro.code == 'object-not-found'){
       return  '';
       print(erro);
     }
     return '';
   }
  }
 

}