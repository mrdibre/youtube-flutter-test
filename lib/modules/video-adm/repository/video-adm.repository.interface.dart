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

  SaveVideoInputDTO({ required this.channelId, required this.name, required this.duration, required this.url });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'name': name,
      'duration': duration,
      'channelId': channelId,
    };
  }
}

abstract class IVideoAdmRepository {
  Future<UploadVideoOutputDTO> uploadVideo(UploadVideoInputDTO dto);
  Future<Video> saveVideo(SaveVideoInputDTO dto);
}