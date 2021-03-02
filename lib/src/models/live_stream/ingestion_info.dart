class IngestionInfo{
  String streamName;
  String ingestionAddress;
  String backupIngestionAddress;

  IngestionInfo.fromJson(Map<String, dynamic> json) {
    ingestionAddress = json["ingestionAddress"];
    streamName = json["streamName"];
    backupIngestionAddress = json["backupIngestionAddress"];
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['ingestionAddress'] = ingestionAddress;
    json['streamName'] = streamName;
    json['backupIngestionAddress'] = backupIngestionAddress;

    if(removeIfNull){
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}