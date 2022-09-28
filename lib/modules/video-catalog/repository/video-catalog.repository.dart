import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_getx/modules/@shared/constants/collections.dart';
import 'package:youtube_getx/modules/video-catalog/domain/channel.dart';
import 'package:youtube_getx/modules/video-catalog/domain/video.dart';
import 'package:youtube_getx/modules/video-catalog/repository/video-catalog.repository.interface.dart';

class VideoCatalogRepository implements IVideoCatalogRepository {
  @override
  Future<List<Video>> getVideos() async {
    List<Video> videos = List.empty(growable: true);
    var snapshot = await FirebaseFirestore.instance.collection(Collection.videos.name).get();

    var cache = Map<String, Channel>();

    for (var doc in snapshot.docs) {
      var videoData = doc.data();
      var channelId = videoData['channelId'];

      Channel? channel = cache[channelId];

      if (channel == null) {
        var channelSnapshot = await FirebaseFirestore.instance.collection(Collection.users.name).doc(channelId).get();
        var channelData = channelSnapshot.data()!;

        channel = Channel.fromJson(channelData);
        cache.putIfAbsent(channelId, () => channel!);
      }

      var video = Video(
        channel: channel,
        id: doc.id,
        url: videoData['url'],
        name: videoData['name'],
        thumbnail: videoData['thumbnailUrl'],
        duration: videoData['duration'],
        viewCount: videoData['viewCount'],
        likeCount: videoData['likeCount'],
        dislikeCount: videoData['dislikeCount'],
      );

      videos.add(video);
    }

    return videos;
  }

}