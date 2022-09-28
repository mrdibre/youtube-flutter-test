import 'package:youtube_getx/modules/video-adm/domain/video.dart';
import 'package:youtube_getx/modules/video-adm/repository/video-adm.repository.interface.dart';
import 'package:youtube_getx/modules/video-adm/usecase/upload-video.usecase.interface.dart';

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

    var uploadThumbnailOutput = await _videoAdmRepository.uploadThumbnail(
      UploadThumbnailInputDTO(
          file: dto.thumbnail,
          channelId: dto.channelId,
          name: dto.name
      )
    );

    var video = await _videoAdmRepository.saveVideo(
      SaveVideoInputDTO(
        name: dto.name,
        duration: dto.duration,
        channelId: dto.channelId,
        url: uploadVideoOutput.videoUrl,
        thumbnailUrl: uploadThumbnailOutput.thumbnailUrl,
      )
    );

    return video;
  }
  
}