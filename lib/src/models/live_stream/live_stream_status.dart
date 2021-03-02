import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class LiveStreamStatus {
  LiveStreamStatus({this.streamStatus, this.healthStatus});

  LiveStreamStatus.fromJson(Map<String, dynamic> json) {
    streamStatus = json["streamStatus"];
    healthStatus = json["healthStatus"] != null ? HealthStatus.fromJson(json["healthStatus"]) : null;
  }

  String streamStatus;
  HealthStatus healthStatus;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['streamStatus'] = streamStatus;
    json['healthStatus'] = healthStatus?.toJson(removeIfNull);

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
