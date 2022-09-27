import 'package:youtube_getx/modules/video-adm/domain/video.dart';
import 'package:youtube_getx/modules/video-adm/facade/video-adm.facade.interface.dart';
import 'package:youtube_getx/modules/video-adm/usecase/upload-video.usecase.interface.dart';

class VideoAdmFacade implements IVideoAdmFacade {
  late IUploadVideo _uploadVideo;

  VideoAdmFacade({ required IUploadVideo uploadVideo }) {
    _uploadVideo = uploadVideo;
  }

  @override
  Future<Video> saveVideo(SaveVideoInputDTO dto) {
    return _uploadVideo.execute(
      UseCaseUploadVideoInputDTO(
          name: dto.name,
          duration: dto.duration,
          channelId: dto.channelId,
          file: dto.file
      )
    );
  }

}