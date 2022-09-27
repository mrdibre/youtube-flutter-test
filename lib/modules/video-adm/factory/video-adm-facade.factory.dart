import 'package:youtube_getx/modules/video-adm/facade/video-adm.facade.dart';
import 'package:youtube_getx/modules/video-adm/facade/video-adm.facade.interface.dart';
import 'package:youtube_getx/modules/video-adm/factory/video-adm-usecase.factory.dart';

IVideoAdmFacade videoAdm() {
  return VideoAdmFacade(
    uploadVideo: uploadVideoUseCase()
  );
}