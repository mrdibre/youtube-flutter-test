import 'package:youtube_getx/modules/video-adm/repository/video-adm.repository.dart';
import 'package:youtube_getx/modules/video-adm/usecase/upload-video.usecase.dart';
import 'package:youtube_getx/modules/video-adm/usecase/upload-video.usecase.interface.dart';

IUploadVideo uploadVideoUseCase() {
  var repository = VideoAdmRepository();

  return UploadVideoUseCase(videoAdmRepository: repository);
}