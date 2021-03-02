import 'package:youtube_live_stream_api/src/models.dart';

class LiveBroadcast {

  LiveBroadcast({this.id, this.kind, this.statistics, this.contentDetails, this.etag, this.snippet, this.status});

  LiveBroadcast.fromJson(Map<String, dynamic> json) {
    kind = json["kind"];
    etag = json["etag"];
    id = json["id"];
    snippet =
    json["snippet"] != null ? Snippet.fromJson(json["snippet"]) : null;
    contentDetails = json["contentDetails"] != null
        ? LiveBroadcastContentDetails.fromJson(json["contentDetails"])
        : null;
    statistics = json["statistics"] != null
        ? Statistics.fromJson(json["statistics"])
        : null;
    status = json["status"] != null
        ? LiveBroadcastStatus.fromJson(json["status"])
        : null;
  }

  String kind;
  String etag;
  String id;
  Snippet snippet;
  LiveBroadcastContentDetails contentDetails;
  Statistics statistics;
  LiveBroadcastStatus status;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['snippet'] = snippet?.toJson(removeIfNull);
    data['contentDetails'] = contentDetails?.toJson(removeIfNull);
    data['statistics'] = statistics?.toJson(removeIfNull);
    data['status'] = status?.toJson(removeIfNull);
    data['kind'] = kind;
    data['etag'] = etag;
    data['id'] = id;
    if (removeIfNull) {
      data.removeWhere((key, value) => value == null);
    }
    return data;
  }
}
