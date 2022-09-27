class Video {
  late String _id;
  late int _duration;
  late String _fileUrl;
  late String _channelId;

  Video({ required String id, required String fileUrl, required int duration, required String channelId }) {
    _id = id;
    _fileUrl = fileUrl;
    _duration = duration;
    _channelId = channelId;
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      fileUrl: json['fileUrl'],
      duration: json['duration'],
      channelId: json['channelId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fileUrl': fileUrl,
      'duration': duration,
      'channelId': channelId,
    };
  }

  String get id => _id;
  int get duration => _duration;
  String get fileUrl => _fileUrl;
  String get channelId => _channelId;

}