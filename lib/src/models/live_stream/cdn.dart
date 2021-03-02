import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class Cdn {
  Cdn({this.frameRate, this.ingestionInfo, this.ingestionType, this.resolution});

  Cdn.fromJson(Map<String, dynamic> json) {
    ingestionType = json["ingestionType"];
    ingestionInfo = json["ingestionInfo"] != null ? IngestionInfo.fromJson(json["ingestionInfo"]) : null;
    resolution = json["resolution"];
    frameRate = json["frameRate"];
  }

  String ingestionType;
  IngestionInfo ingestionInfo;
  String resolution;
  String frameRate;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['ingestionType'] = ingestionType;
    json['resolution'] = resolution;
    json['frameRate'] = frameRate;
    json['ingestionInfo'] = ingestionInfo?.toJson(removeIfNull);

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
