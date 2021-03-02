import 'package:youtube_live_stream_api/src/models.dart';

class HealthStatus {
  String status;
  int lastUpdateTimeSeconds;

  ConfigurationIssues configurationIssues;

  HealthStatus.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    lastUpdateTimeSeconds = json["lastUpdateTimeSeconds"];
    configurationIssues = json["configurationIssues"] != null
        ? ConfigurationIssues.fromJson(json["configurationIssues"])
        : null;
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['lastUpdateTimeSeconds'] = lastUpdateTimeSeconds;
    json['configurationIssues'] = configurationIssues?.toJson(removeIfNull);

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
