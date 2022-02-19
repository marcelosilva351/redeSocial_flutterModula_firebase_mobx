import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:rede_social/app/feed/feed_store.dart';
import 'package:flutter/material.dart';
import 'package:rede_social/app/userpost/userpost_module.dart';
import 'package:rede_social/app/userpost/userpost_store.dart';
import 'package:rede_social/core/models/post_model.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key? key, this.title = 'FeedPage'}) : super(key: key);
  @override
  FeedPageState createState() => FeedPageState();
}
class FeedPageState extends State<FeedPage> {

  final FeedStore store = Modular.get();
    @override
  void initState() {
    store.getPosts();
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
        actions: [Padding(padding: EdgeInsets.only(right: 8), child: IconButton(onPressed: (){store.getPosts();}, icon: Icon(Icons.refresh, color: Colors.white,)))],
      ),
      body: ObserverFuture<List<PostModel>, Exception>( // Use this widget to handle ObservableFuture events
  retry: 2, // It will retry 2 times after the first error event
  autoInitialize: false, // If true, it will call [fetchData] automatically
  fetchData: store.getPostsFromMobxWidget, // VoidCallback
  
  observableFuture: () => store.postsUser,
  onData: (_, data)  {
 return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {

      var post = data[index];
      String foto = '';
      
    
     
    return  FutureBuilder<String>(
      future: store.getUserPhoto(post.emailUser),
      builder: (context,snapchot){
        if(!snapchot.hasData){
          return Row(mainAxisAlignment: MainAxisAlignment.start, children: [Padding(
            padding: const EdgeInsets.all(32.0),
            child: CircularProgressIndicator(color: Colors.blue,),
          )],);
        
        }
        return Column(
          children: [
            SizedBox(height: 15,),
            Padding(padding: EdgeInsets.only(left: 10, right: 10),child:
            Column(
              children: [
                Text(post.emailUser),
                Card(
                  elevation: 12,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(image: NetworkImage(snapchot.data! == ''? 'https://th.bing.com/th/id/OIP.2mOnyDDiSOsxkH1OUQl4agHaHa?pid=ImgDet&rs=1' : snapchot.data!), fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Row(
                              children: [
                                Expanded(child: Text("Titulo: " + post.titulo,textAlign: TextAlign.start ,style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),)),
                              ],
                            ), 
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Conteudo: ' + post.conteudo, style: TextStyle(color: Colors.white, fontSize: 20),
                                                          ),
                                ),
                              ],
                            )],),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            )
          ],
        );
    });
      
    
     
  });},
  onNull: (_) => Text('NULL'),
  onError: (_, error) => Text('${error.toString()}'),
  onPending: (_) => Center(child: CircularProgressIndicator(color: Colors.white,)),
  onUnstarted: (_) => Text('UNSTARTED'),
)
    );
  }
}


class ContainerNoFoto extends StatelessWidget {
  const ContainerNoFoto({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(80)),
        border: Border.all(color: Colors.blue),
        color: Colors.white,
        image: DecorationImage(image: NetworkImage('https://th.bing.com/th/id/OIP.2mOnyDDiSOsxkH1OUQl4agHaHa?w=219&h=219&c=7&r=0&o=5&pid=1.7'), fit: BoxFit.fitWidth)
      ),
      
    );
  }
}

class ContainerFoto extends StatelessWidget {
  String urlImage;
  ContainerFoto(this.urlImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 90,
      decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80)),

        border: Border.all(color: Colors.blue),
        color: Colors.white,
        image: DecorationImage(image: NetworkImage(urlImage), fit: BoxFit.cover)
      ),
      
    );
  }
}