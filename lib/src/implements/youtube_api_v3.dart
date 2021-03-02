import 'package:flutter/cupertino.dart';
import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class YoutubeApiV3 extends YoutubeApi {
  String _apiKey;
  final String _baseUrl = "https://youtube.googleapis.com/youtube/v3";
  ApiClient _apiClient;
  bool _log;

  YoutubeApiV3({@required String apiKey, bool log = true}) {
    _apiKey = apiKey;
    _apiClient = ApiClientImpl(apiConfig: ApiConfig(url: "$_baseUrl"));
    _apiClient.setup();
    _log = log;
  }

  @override
  void setLog({bool log = true}) {
    _log = log;
  }

  @override
  Future<LiveBroadcast> deleteLiveBroadcast({
    String accessToken,
    LiveQuery query,
  }) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response = await _apiClient.httpDelete(
      "/liveBroadcasts",
      parameters: parameters,
    );

    return LiveBroadcast.fromJson(response);
  }

  @override
  Future<LiveBroadcastListResponse> getLiveBroadcastList({
    String accessToken,
    LiveQuery query,
  }) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response = await _apiClient.httpGet(
      "/liveBroadcasts",
      parameters: parameters,
    );

    return LiveBroadcastListResponse.fromJson(response);
  }

  @override
  Future<LiveBroadcast> insertLiveBroadcast({
    String accessToken,
    LiveQuery query,
    LiveBroadcast liveBroadcast,
  }) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response =
        await _apiClient.httpPost("/liveBroadcasts", parameters: parameters, data: liveBroadcast?.toJson(true));

    return LiveBroadcast.fromJson(response);
  }

  @override
  Future<LiveBroadcast> transitionLiveBroadcast({
    String accessToken,
    LiveQuery query,
  }) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response = await _apiClient.httpPost(
      "/liveBroadcasts/transition",
      parameters: parameters,
    );

    return LiveBroadcast.fromJson(response);
  }

  @override
  Future<LiveBroadcast> updateLiveBroadcast({
    String accessToken,
    LiveQuery query,
    LiveBroadcast liveBroadcast,
  }) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response =
        await _apiClient.httpPut("/liveBroadcasts", parameters: parameters, data: liveBroadcast?.toJson(true));

    return LiveBroadcast.fromJson(response);
  }

  @override
  Future<LiveBroadcast> bindLiveBroadcast({
    String accessToken,
    LiveQuery query,
  }) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response = await _apiClient.httpPost(
      "/liveBroadcasts/bind",
      parameters: parameters,
    );

    return LiveBroadcast.fromJson(response);
  }

  @override
  Future<LiveStream> deleteLiveStream({String accessToken, LiveQuery query}) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response = await _apiClient.httpDelete(
      "/liveStreams",
      parameters: parameters,
    );

    return LiveStream.fromJson(response);
  }

  @override
  Future<LiveStreamListResponse> getLiveStreamList({String accessToken, LiveQuery query}) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response = await _apiClient.httpGet(
      "/liveStreams",
      parameters: parameters,
    );

    return LiveStreamListResponse.fromJson(response);
  }

  @override
  Future<LiveStream> insertLiveStream({String accessToken, LiveQuery query, LiveStream liveStream}) async {
    assert(accessToken != null);

    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> response = await _apiClient.httpPost(
      "/liveStreams",
      parameters: parameters,
      data: liveStream?.toJson(true),
    );

    return LiveStream.fromJson(response);
  }

  @override
  Future<LiveStream> updateLiveStream({String accessToken, LiveQuery query, LiveStream liveStream}) async {
    assert(accessToken != null);
    _apiClient.setToken(token: accessToken);
    Map<String, dynamic> parameters = query?.toJson(true);

    if (parameters != null) {
      parameters['key'] = _apiKey;
    } else {
      parameters = {'key': _apiKey};
    }
    Map<String, dynamic> response = await _apiClient.httpPut(
      "/liveStreams",
      parameters: parameters,
      data: liveStream?.toJson(true),
    );

    return LiveStream.fromJson(response);
  }
}
