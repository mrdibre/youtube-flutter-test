import 'package:youtube_getx/modules/video-catalog/domain/video.dart';

abstract class IVideoCatalogRepository {
  Future<List<Video>> getVideos();
}