import 'dart:core';

import 'package:youtube_live_stream_api/src/models/monitor_stream.dart';

class LiveBroadcastContentDetails {
  LiveBroadcastContentDetails({
    this.monitorStream,
    this.recordFromStart,
    this.boundStreamId,
    this.boundStreamLastUpdateTimeMs,
    this.closedCaptionsType,
    this.enableAutoStart,
    this.enableAutoStop,
    this.enableClosedCaptions,
    this.enableContentEncryption,
    this.enabledEmbed,
    this.enableEvr,
    this.enableLowLatency,
    this.latencyPreference,
    this.projection,
    this.startWithSlate,
  });

  String boundStreamId;
  String boundStreamLastUpdateTimeMs;
  bool enabledEmbed;
  bool enableEvr;
  bool enableContentEncryption;
  bool startWithSlate;
  bool recordFromStart;
  bool enableClosedCaptions;
  String closedCaptionsType;
  String projection;
  bool enableLowLatency;
  String latencyPreference;
  bool enableAutoStart;
  bool enableAutoStop;
  MonitorStream monitorStream;

  LiveBroadcastContentDetails.fromJson(Map<String, dynamic> json) {
    boundStreamId = json["boundStreamId"];
    boundStreamLastUpdateTimeMs = json["boundStreamLastUpdateTimeMs"];
    monitorStream = json["monitorStream"] != null ? MonitorStream.fromJson(json["monitorStream"]) : null;
    enabledEmbed = json["enabledEmbed"];
    enableEvr = json["enableEvr"];
    enableContentEncryption = json["enableContentEncryption"];
    startWithSlate = json["startWithSlate"];
    recordFromStart = json["recordFromStart"];
    enableClosedCaptions = json["enableClosedCaptions"];
    closedCaptionsType = json["closedCaptionsType"];
    projection = json["projection"];
    enableLowLatency = json["enableLowLatency"];
    latencyPreference = json["latencyPreference"];
    enableAutoStart = json["enableAutoStart"];
    enableAutoStop = json["enableAutoStop"];
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['monitorStream'] = monitorStream?.toJson(removeIfNull);
    json['boundStreamId'] = boundStreamId;
    json['enableAutoStop'] = enableAutoStop;
    json['enableAutoStart'] = enableAutoStart;
    json['latencyPreference'] = latencyPreference;
    json['enableLowLatency'] = enableLowLatency;
    json['projection'] = projection;
    json['closedCaptionsType'] = closedCaptionsType;
    json['enableClosedCaptions'] = enableClosedCaptions;
    json['recordFromStart'] = recordFromStart;
    json['startWithSlate'] = startWithSlate;
    json['enableContentEncryption'] = enableContentEncryption;
    json['enableEvr'] = enableEvr;
    json['enabledEmbed'] = enabledEmbed;
    json['boundStreamId'] = boundStreamId;
    json['boundStreamLastUpdateTimeMs'] = boundStreamLastUpdateTimeMs;

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
