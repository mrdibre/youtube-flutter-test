import 'package:youtube_getx/modules/video-catalog/domain/video.dart';
import 'package:youtube_getx/modules/video-catalog/facade/video-catalog.facade.interface.dart';
import 'package:youtube_getx/modules/video-catalog/repository/video-catalog.repository.interface.dart';

class VideoCatalogFacade implements IVideoCatalogFacade {
  late IVideoCatalogRepository _videoCatalogRepository;

  VideoCatalogFacade({ required IVideoCatalogRepository videoCatalogRepository }){
    _videoCatalogRepository = videoCatalogRepository;
  }

  @override
  Future<List<Video>> getVideos() {
    return _videoCatalogRepository.getVideos();
  }
}