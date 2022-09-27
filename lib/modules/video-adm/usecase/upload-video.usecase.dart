import 'package:youtube_getx/modules/video-adm/domain/video.dart';
import 'package:youtube_getx/modules/video-adm/repository/video-adm.repository.interface.dart';
import 'package:youtube_getx/modules/video-adm/usecase/upload-video.usecase.interface.dart';

// TODO: Refactor in two use cases (UploadVideoUseCase + SaveVideoUseCase)
class UploadVideoUseCase implements IUploadVideo {
  late IVideoAdmRepository _videoAdmRepository;

  UploadVideoUseCase({ required IVideoAdmRepository videoAdmRepository }) {
    _videoAdmRepository = videoAdmRepository;
  }

  @override
  Future<Video> execute(UseCaseUploadVideoInputDTO dto) async {
    var uploadVideoOutput = await _videoAdmRepository.uploadVideo(
      UploadVideoInputDTO(
        file: dto.file,
        name: dto.name,
        channelId: dto.channelId,
      )
    );

    var video = await _videoAdmRepository.saveVideo(
      SaveVideoInputDTO(
        name: dto.name,
        duration: dto.duration,
        channelId: dto.channelId,
        url: uploadVideoOutput.videoUrl,
      )
    );

    return video;
  }
  
}