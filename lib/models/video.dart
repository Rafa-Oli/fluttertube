class Video {
  String? id;
  String? title;
  String? thumb;
  String? channel;

  // Video(this.id, this.title, this.thumb, this.channel);
  Video();

  factory Video.fromJson(Map<String, dynamic> json) {
    var video = Video();
    video.id = json['id']['videoId'];
    video.title = json['snippet']['title'];
    video.thumb = json['snippet']['thumbnails']['high']['url'];
    video.channel = json['snippet']['channelTitle'];

    return video;
  }
}
