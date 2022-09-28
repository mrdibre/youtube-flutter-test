import 'dart:io';

import 'package:youtube_getx/modules/video-adm/domain/video.dart';

class UploadVideoInputDTO {
  String channelId;
  String name;
  File file;

  UploadVideoInputDTO({ required this.channelId, required this.name, required this.file });
}

class UploadVideoOutputDTO {
  String videoUrl;

  UploadVideoOutputDTO({ required this.videoUrl });
}

class SaveVideoInputDTO {
  String channelId;
  String name;
  int duration;
  String url;
  String thumbnailUrl;

  SaveVideoInputDTO({ required this.channelId, required this.name, required this.duration, required this.url, required this.thumbnailUrl });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'name': name,
      'duration': duration,
      'channelId': channelId,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}

class UploadThumbnailOutputDTO {
  String thumbnailUrl;

  UploadThumbnailOutputDTO({ required this.thumbnailUrl });
}

class UploadThumbnailInputDTO {
  File file;
  String channelId;
  String name;

  UploadThumbnailInputDTO({ required this.file, required this.channelId, required this.name });
}

abstract class IVideoAdmRepository {
  Future<Video> saveVideo(SaveVideoInputDTO dto);
  Future<UploadVideoOutputDTO> uploadVideo(UploadVideoInputDTO dto);
  Future<UploadThumbnailOutputDTO> uploadThumbnail(UploadThumbnailInputDTO dto);
}