class ConfigurationIssues{
  String type;
  String severity;
  String reason;
  String description;

  ConfigurationIssues.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    severity = json["severity"];
    reason = json["reason"];
    description = json["description"];
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['type'] = type;
    json['severity'] = severity;
    json['reason'] = reason;
    json['description'] = description;

    if(removeIfNull){
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}