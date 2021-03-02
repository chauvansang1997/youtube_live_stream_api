class Statistics {
  int totalChatCount;

  Statistics.fromJson(Map<String, dynamic> json) {
    totalChatCount = json["totalChatCount"];
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalChatCount'] = totalChatCount;

    if(removeIfNull){
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
