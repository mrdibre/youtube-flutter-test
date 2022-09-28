import 'package:youtube_getx/modules/video-catalog/facade/video-catalog.facade.dart';
import 'package:youtube_getx/modules/video-catalog/facade/video-catalog.facade.interface.dart';
import 'package:youtube_getx/modules/video-catalog/repository/video-catalog.repository.dart';

IVideoCatalogFacade videoCatalog() {
  var repository = VideoCatalogRepository();

  return VideoCatalogFacade(videoCatalogRepository: repository);
}