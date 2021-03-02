import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class Snippet {
  Snippet({
    this.thumbnails,
    this.title,
    this.channelId,
    this.publishedAt,
    this.description,
    this.actualEndTime,
    this.actualStartTime,
    this.isDefaultBroadcast,
    this.liveChatId,
    this.scheduledEndTime,
    this.scheduledStartTime,
    this.enableDvr,
    this.enableEmbed,
  });

  Snippet.fromJson(Map<String, dynamic> json) {
    publishedAt = json["publishedAt"] != null ? DateTime.parse(json["publishedAt"]) : null;
    channelId = json["channelId"];
    title = json["title"];
    description = json["description"];
    thumbnails = json["thumbnails"] != null ? Thumbnails.fromJson(json["thumbnails"]) : null;
    scheduledStartTime =
        json["scheduledStartTime"] != null ? DateTime.parse(json["scheduledStartTime"]).toLocal() : null;
    scheduledEndTime = json["scheduledEndTime"] != null ? DateTime.parse(json["scheduledEndTime"]).toLocal() : null;
    actualStartTime = json["actualStartTime"] != null ? DateTime.parse(json["actualStartTime"]).toLocal() : null;
    actualEndTime = json["actualEndTime"] != null ? DateTime.parse(json["actualEndTime"]).toLocal() : null;
    isDefaultBroadcast = json["isDefaultBroadcast"];
    liveChatId = json["liveChatId"];
    enableEmbed = json["enableEmbed"];
    enableDvr = json["enableDvr"];
  }

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  DateTime scheduledStartTime;
  DateTime scheduledEndTime;
  DateTime actualStartTime;
  DateTime actualEndTime;
  bool isDefaultBroadcast;
  bool enableEmbed;
  bool enableDvr;
  String liveChatId;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['publishedAt'] = publishedAt?.toUtc()?.toIso8601String();
    json['actualEndTime'] = actualEndTime?.toUtc()?.toIso8601String();
    json['actualStartTime'] = actualStartTime?.toUtc()?.toIso8601String();
    json['scheduledEndTime'] = scheduledEndTime?.toUtc()?.toIso8601String();
    json['scheduledStartTime'] = scheduledStartTime?.toUtc()?.toIso8601String();
    json['liveChatId'] = liveChatId;
    json['thumbnails'] = thumbnails?.toJson(removeIfNull);
    json['description'] = description;
    json['title'] = title;
    json['channelId'] = channelId;
    json['isDefaultBroadcast'] = isDefaultBroadcast;
    json['enableEmbed'] = enableEmbed;
    json['enableDvr'] = enableDvr;

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
