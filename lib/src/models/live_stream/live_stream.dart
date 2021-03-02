import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class LiveStream {
  LiveStream({this.status, this.snippet, this.etag, this.contentDetails, this.kind, this.id, this.cdn});

  LiveStream.fromJson(Map<String, dynamic> json) {
    kind = json["kind"];
    etag = json["etag"];
    id = json["id"];
    contentDetails = json["contentDetails"] != null ? LiveStreamContentDetails.fromJson(json["contentDetails"]) : null;
    status = json["status"] != null ? LiveStreamStatus.fromJson(json["status"]) : null;
    snippet = json["snippet"] != null ? Snippet.fromJson(json["snippet"]) : null;

    cdn = json["cdn"] != null ? Cdn.fromJson(json["cdn"]) : null;
  }

  String kind;
  String etag;
  String id;
  LiveStreamContentDetails contentDetails;
  Cdn cdn;
  Snippet snippet;
  LiveStreamStatus status;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contentDetails'] = contentDetails?.toJson(removeIfNull);
    data['status'] = status?.toJson(removeIfNull);
    data['cdn'] = cdn?.toJson(removeIfNull);
    data['kind'] = kind;
    data['etag'] = etag;
    data['id'] = id;
    data['snippet'] = snippet?.toJson(removeIfNull);
    if (removeIfNull) {
      data.removeWhere((key, value) => value == null);
    }
    return data;
  }
}
