import 'package:youtube_getx/modules/video-catalog/domain/channel.dart';

class Video {
  late String _id;
  late String _url;
  late String _name;
  late String _thumbnail;
  late int _duration;
  late Channel _channel;
  late int _viewCount;
  late int _likeCount;
  late int _dislikeCount;

  Video({
    required String id,
    required String url,
    required String name,
    required String thumbnail,
    required int duration,
    required Channel channel,
    int? viewCount,
    int? likeCount,
    int? dislikeCount,
  }) {
    _id = id;
    _url = url;
    _name = name;
    _duration = duration;
    _thumbnail = thumbnail;
    _viewCount = viewCount ?? 0;
    _likeCount = likeCount ?? 0;
    _dislikeCount = dislikeCount ?? 0;
    _channel = channel;
  }

  void like() {
    _likeCount += 1;
  }

  void dislike() {
    _dislikeCount += 1;
  }

  void view() {
    _viewCount += 1;
  }

  String get id => _id;
  String get url => _url;
  String get name => _name;
  String get thumbnail => _thumbnail;
  int get duration => _duration;
  Channel get channel => _channel;
  int get likeCount => _likeCount;
  int get viewCount => _viewCount;
  int get dislikeCount => _dislikeCount;
}