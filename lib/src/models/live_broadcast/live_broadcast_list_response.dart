import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class LiveBroadcastListResponse {
  String kind;
  String etag;
  String nextPageToken;
  String prevPageToken;
  PageInfo pageInfo;
  List<LiveBroadcast> items;

  LiveBroadcastListResponse.fromJson(Map<String, dynamic> json) {
    kind = json["kind"];
    etag = json["etag"];
    nextPageToken = json["nextPageToken"];
    prevPageToken = json["prevPageToken"];

    pageInfo = json["pageInfo"] != null ? PageInfo.fromJson(json["pageInfo"]) : null;
    final List<LiveBroadcast> liveBroadcasts = [];

    if (json["items"] != null) {
      final jsonList = json["items"] as List;
      for (final item in jsonList) {
        liveBroadcasts.add(new LiveBroadcast.fromJson(item));
      }
    }
    items = liveBroadcasts;
  }
}
