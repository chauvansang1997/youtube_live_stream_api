class LiveQuery {
  LiveQuery(
      {this.id,
      this.mine,
      this.accessToken,
      this.maxResults,
      this.alt,
      this.broadcastStatus,
      this.fields,
      this.callback,
      this.onBehalfOfContentOwner,
      this.pageToken,
      this.prettyPrint,
      this.quotaUser,
      this.onBehalfOfContentOwnerChannel,
      this.uploadProtocol,
      this.uploadType,
      this.xgafv,
      this.part,this.streamId});

  String part;
  String broadcastStatus;
  String id;
  String streamId;
  bool mine;
  int maxResults;
  String onBehalfOfContentOwner;
  String onBehalfOfContentOwnerChannel;
  String pageToken;
  String uploadType;
  String quotaUser;
  String callback;
  String prettyPrint;
  String accessToken;
  String fields;
  String alt;
  String xgafv;
  String uploadProtocol;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['broadcastStatus'] = broadcastStatus;
    data['part'] = part;
    data['id'] = id;
    data['mine'] = mine;
    data['maxResults'] = maxResults;
    data['onBehalfOfContentOwner'] = onBehalfOfContentOwner;
    data['onBehalfOfContentOwnerChannel'] = onBehalfOfContentOwnerChannel;
    data['pageToken'] = pageToken;
    data['uploadType'] = uploadType;
    data['quotaUser'] = quotaUser;
    data['callback'] = callback;
    data['prettyPrint'] = prettyPrint;
    data['accessToken'] = accessToken;
    data['\$.xgafv'] = xgafv;
    data['uploadProtocol'] = uploadProtocol;
    data['streamId'] = streamId;
    if (removeIfNull) {
      data.removeWhere((key, value) => value == null);
    }
    return data;
  }
}
