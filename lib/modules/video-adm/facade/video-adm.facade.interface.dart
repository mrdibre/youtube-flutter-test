import 'dart:io';

import 'package:youtube_getx/modules/video-adm/domain/video.dart';

class SaveVideoInputDTO {
  String channelId;
  String name;
  int duration;
  File file;
  File thumbnail;

  SaveVideoInputDTO({ required this.channelId, required this.name, required this.duration, required this.file, required this.thumbnail });
}

abstract class IVideoAdmFacade {
  Future<Video> saveVideo(SaveVideoInputDTO dto);
}