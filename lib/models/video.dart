class Video {
  String? id;
  String? title;
  String? thumb;
  String? channel;

  Video({this.id, this.title, this.thumb, this.channel});
  // Video();

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("id")) {
      return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        thumb: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelTitle'],
      );
    } else {
      return Video(
        id: json["id"],
        title: json["title"],
        thumb: json["thumb"],
        channel: json["channel"],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "videoId": id,
      "title": title,
      "thumb": thumb,
      "channel": channel,
    };
  }
}
