import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rede_social/core/models/post_model.dart';

class PostRepository{
  var bd = FirebaseFirestore.instance;

  Future<List<PostModel>>getUserPosts(String email) async{
    List<PostModel> postsUser = [];
    var postsBd = await bd.collection('posts').where('emailUser', isEqualTo: email).get();
    for(var post in postsBd.docs){
      var postAdd = PostModel(post.id,post['emailUser'], post['titulo'], post['conteudo']);
      postsUser.add(postAdd);
    }
    return postsUser;
  }

   Future<List<PostModel>>getPosts() async{
    List<PostModel> postsUser = [];
    var postsBd = await bd.collection('posts').get();
    for(var post in postsBd.docs){
      var postAdd = PostModel(post.id,post['emailUser'], post['titulo'], post['conteudo']);
      postsUser.add(postAdd);
    }
    return postsUser;
  }

 editarPost(PostModel postEdit) async{
  await bd.collection('posts').doc(postEdit.code).set({
   'titulo' : postEdit.titulo,
   'conteudo' : postEdit.conteudo,
   'emailUser' : postEdit.emailUser
  });
 }

 Future<bool> excluir(String code) async{
  return await bd.collection('posts').doc(code).delete().then((value) => true).catchError((erro) {return false;});
 }


 Future<bool> addPostUser(PostModel post) async{
    var postAdd = {
      'emailUser' : post.emailUser,
      'titulo' : post.titulo,
      'conteudo' : post.conteudo
    };
    return await bd.collection('posts').add(postAdd).then((value) => true).catchError((erro) {return false;});
    }
}