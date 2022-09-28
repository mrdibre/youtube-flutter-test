import 'package:flutter/material.dart';
import 'package:youtube_getx/modules/video-catalog/domain/video.dart';
import 'package:youtube_getx/modules/video-catalog/factory/video-catalog-facade.factory.dart';
import 'package:youtube_getx/ui/components/top-bar/top-bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: FutureBuilder<List<Video>>(
        future: videoCatalog().getVideos(),
        initialData: [],
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var video = snapshot.data!.elementAt(index);
                  var duration = Duration(minutes: video.duration).toString();

                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    child: GestureDetector(
                      onTap: () {
                        print("Navigating to video ${video.id}");
                      },
                      child: Column(
                        children: [
                          Image.network(
                            video.thumbnail,
                            fit: BoxFit.fill,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
                            title: Text(video.name),
                            subtitle: Text("${video.channel.name} - ${video.viewCount} visualizações - $duration"),
                            trailing: PopupMenuButton<String>(
                              elevation: 2,
                              onSelected: (selected){},
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(child: Text("Adicionar a playlist"))
                                ];
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: TopBar(),
  //     body: ListView.builder(
  //         itemCount: 10,
  //         itemBuilder: (context, index) {
  //           return Card(
  //             elevation: 0,
  //             margin: EdgeInsets.all(0),
  //             child: Column(
  //               children: [
  //                 Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"),
  //                 ListTile(
  //                   contentPadding: EdgeInsets.symmetric(horizontal: 8),
  //                   leading: CircleAvatar(
  //                     child: ClipOval(
  //                       child: Image.network(
  //                         "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
  //                         fit: BoxFit.cover,
  //                         width: 60,
  //                         height: 60,
  //                       ),
  //                     ),
  //                   ),
  //                   title: Text("Vídeo ${index}"),
  //                   subtitle: Text("Canal - 10K visualizações - 45 minutos atrás"),
  //                   trailing: PopupMenuButton<String>(
  //                     elevation: 2,
  //                     onSelected: (selected){},
  //                     itemBuilder: (context) {
  //                       return [
  //                         PopupMenuItem(child: Text("Adicionar a playlist"))
  //                       ];
  //                     },
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  //         }
  //     ),
  //   );
  // }
}
