class LiveBroadcastStatus {
  String lifeCycleStatus;
  String privacyStatus;
  String recordingsStatus;
  bool madeForKinds;
  bool selfDeclaredMadeForKinds;

  LiveBroadcastStatus({
    this.lifeCycleStatus,
    this.privacyStatus,
    this.recordingsStatus,
    this.selfDeclaredMadeForKinds,
    this.madeForKinds,
  });

  LiveBroadcastStatus.fromJson(Map<String, dynamic> json) {
    lifeCycleStatus = json["lifeCycleStatus"];
    privacyStatus = json["privacyStatus"];
    recordingsStatus = json["recordingsStatus"];
    madeForKinds = json["madeForKinds"];
    selfDeclaredMadeForKinds = json["selfDeclaredMadeForKinds"];
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['lifeCycleStatus'] = lifeCycleStatus;
    json['privacyStatus'] = privacyStatus;
    json['recordingsStatus'] = recordingsStatus;
    json['madeForKinds'] = madeForKinds;
    json['selfDeclaredMadeForKinds'] = selfDeclaredMadeForKinds;

    if (removeIfNull) {
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
