class LiveStreamContentDetails {
  LiveStreamContentDetails({this.closedCaptionsIngestionUrl, this.isReusable});

  LiveStreamContentDetails.fromJson(Map<String, dynamic> json) {
    closedCaptionsIngestionUrl = json["closedCaptionsIngestionUrl"];
    isReusable = json["isReusable"];
  }

  String closedCaptionsIngestionUrl;
  bool isReusable;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['closedCaptionsIngestionUrl'] = closedCaptionsIngestionUrl;
    json['isReusable'] = isReusable;

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
