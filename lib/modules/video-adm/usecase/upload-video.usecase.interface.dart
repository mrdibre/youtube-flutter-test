import 'dart:io';

import 'package:youtube_getx/modules/video-adm/domain/video.dart';

class UseCaseUploadVideoInputDTO {
  String channelId;
  String name;
  int duration;
  File file;

  UseCaseUploadVideoInputDTO({ required this.channelId, required this.name, required this.duration, required this.file });
}

abstract class IUploadVideo {
  Future<Video> execute(UseCaseUploadVideoInputDTO dto);
}