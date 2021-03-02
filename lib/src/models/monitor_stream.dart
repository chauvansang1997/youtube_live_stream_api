class MonitorStream {
  bool enableMonitorStream;
  int broadcastSteamDelayMs;
  String embedHtml;

  MonitorStream({this.enableMonitorStream, this.broadcastSteamDelayMs, this.embedHtml});

  MonitorStream.fromJson(Map<String, dynamic> json) {
    enableMonitorStream = json["enableMonitorStream"];
    broadcastSteamDelayMs = json["broadcastSteamDelayMs"];
    embedHtml = json["embedHtml"];
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['enableMonitorStream'] = enableMonitorStream;
    json['broadcastSteamDelayMs'] = broadcastSteamDelayMs;
    json['embedHtml'] = embedHtml;

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }

    return json;
  }
}
