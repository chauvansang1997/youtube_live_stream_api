class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo.fromJson(Map<String, dynamic> json) {
    totalResults = json["totalResults"];
    resultsPerPage = json["resultsPerPage"];
  }

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalResults'] = totalResults;
    json['resultsPerPage'] = resultsPerPage;

    if(removeIfNull){
      json.removeWhere((key, value) => value == null);
    }
    return json;
  }
}
