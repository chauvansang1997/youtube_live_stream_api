import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class LiveStreamListResponse {
  String kind;
  String etag;
  String nextPageToken;
  String prevPageToken;
  PageInfo pageInfo;
  List<LiveStream> items;

  LiveStreamListResponse.fromJson(Map<String, dynamic> json) {
    kind = json["kind"];
    etag = json["etag"];
    nextPageToken = json["nextPageToken"];
    prevPageToken = json["prevPageToken"];

    pageInfo = json["pageInfo"] != null ? PageInfo.fromJson(json["pageInfo"]) : null;
    final List<LiveStream> liveStreams = [];

    if (json["items"] != null) {
      final jsonList = json["items"] as List;
      for (final item in jsonList) {
        liveStreams.add(new LiveStream.fromJson(item));
      }
    }
    items = liveStreams;
  }
}
