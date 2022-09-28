import '../domain/video.dart';

abstract class IVideoCatalogFacade {
  Future<List<Video>> getVideos();
}