import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:youtube_getx/modules/@shared/constants/collections.dart';
import 'package:youtube_getx/modules/video-adm/domain/video.dart';
import 'package:youtube_getx/modules/video-adm/repository/video-adm.repository.interface.dart';

class VideoAdmRepository implements IVideoAdmRepository {
  @override
  Future<Video> saveVideo(SaveVideoInputDTO dto) async {
    var resource = await FirebaseFirestore
        .instance
        .collection(Collection.videos.name)
        .add(dto.toMap());

    return Video(
      id: resource.id,
      fileUrl: dto.url,
      duration: dto.duration,
      channelId: dto.channelId,
    );
  }

  @override
  Future<UploadVideoOutputDTO> uploadVideo(UploadVideoInputDTO dto) async {
    var file = FirebaseStorage
        .instance
        .ref("/videos")
        .child(dto.channelId)
        .child(dto.name);

    var task = await file.putFile(dto.file);

    var videoUrl = await task.ref.getDownloadURL();

    return UploadVideoOutputDTO(videoUrl: videoUrl);
  }
}