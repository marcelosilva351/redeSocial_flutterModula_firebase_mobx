import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:rede_social/app/userpost/userpost_store.dart';
import 'package:flutter/material.dart';
import 'package:rede_social/core/models/post_model.dart';

class UserpostPage extends StatefulWidget {
  final String email;
  UserpostPage(this.email);
  @override
  UserpostPageState createState() => UserpostPageState();
}
class UserpostPageState extends State<UserpostPage> {
  final UserpostStore store = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    store.getPosts(widget.email);
    store.emailUser = widget.email;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('Adicionar post'),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(label: Text('Titulo')),
                    controller: store.controllerTituloPost,
                  ),TextField(
                    decoration: InputDecoration(label: Text('Conteudo')),
                    controller: store.controllerConteudoPost,
                  ),
                  Observer(builder: (context) => Text(store.stringResultCriarPost))
                ],
              ),
            ),
            actions: [ElevatedButton(onPressed: () async{
            var result =  await store.addPost(widget.email);
            if(result){
              Navigator.pop(context);
            }

              
            }, child: Text('Criar post'))],
          );
        });
      }),
      appBar: AppBar(
        title: Text('Meus Posts'),
        
      ),
      body: Padding(padding: EdgeInsets.all(32),
      child:
       ObserverFuture<List<PostModel>, Exception>( // Use this widget to handle ObservableFuture events
  retry: 2, // It will retry 2 times after the first error event
  autoInitialize: true,
  fetchData: store.getPostsFromMobxWidget,
   // If true, it will call [fetchData] automatically  
  observableFuture: () => store.postsUser,
  onData: (_, data) {
  if(data.length == 0){
    return Center(child: Text("Você não criou nenhum post"));
  }
  
return  ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index){
      var post = data[index];
      return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                title: Text(post.titulo, style: TextStyle(color: Colors.black, fontSize: 20),),
                subtitle: Text(post.conteudo, style: TextStyle(fontSize: 17),),
                
              ),
            ),
            Row(children: [
              IconButton(icon: Icon(Icons.edit, color: Colors.blue,), onPressed: (){
                 showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('Editar'),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(label: Text('Titulo')),
                    controller: store.controllerTituloPostEdit,
                  ),TextField(
                    decoration: InputDecoration(label: Text('Conteudo')),
                    controller: store.controllerConteudoPostEdit,
                  ),
                ],
              ),
            ),
            actions: [ElevatedButton(onPressed: () async{
            var result = await store.editPost(post.code!, widget.email);
            if(result){
              Navigator.pop(context);


            }
  
            
           
            

              
            }, child: Text('Editar post'))],
          );
        });
              },),
              SizedBox(width: 4,),
              IconButton(icon: Icon(Icons.remove_circle, color: Colors.red), onPressed: (){store.excluirPost(post.code!, widget.email);},),
              SizedBox(width: 4,),

            ],)
          ],
        ),
      );
    
  });},
  onNull: (_) => const Text('Nenhum post criado'),
  onError: (_, error) => const Text('Ocorreu um erro ao pesquisar os posts'),
  onPending: (_) => const Center(child: CircularProgressIndicator(color: Colors.blue,),),
  onUnstarted: (_) => const Text(''),
)
    ));
  }
}