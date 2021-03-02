import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

abstract class YoutubeApi {

  void setLog({bool log = true});

  ///https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/list#http-request
  Future<LiveBroadcastListResponse> getLiveBroadcastList({
    String accessToken,
    LiveQuery query,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/insert
  Future<LiveBroadcast> insertLiveBroadcast({
    String accessToken,
    LiveQuery query,
    LiveBroadcast liveBroadcast,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/update
  Future<LiveBroadcast> updateLiveBroadcast({
    String accessToken,
    LiveQuery query,
    LiveBroadcast liveBroadcast,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/transition
  Future<LiveBroadcast> transitionLiveBroadcast({
    String accessToken,
    LiveQuery query,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/delete
  Future<LiveBroadcast> deleteLiveBroadcast({
    String accessToken,
    LiveQuery query,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/bind
  Future<LiveBroadcast> bindLiveBroadcast({
    String accessToken,
    LiveQuery query,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveStreams/list
  Future<LiveStreamListResponse> getLiveStreamList({
    String accessToken,
    LiveQuery query,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveStreams/insert
  Future<LiveStream> insertLiveStream({
    String accessToken,
    LiveQuery query,
    LiveStream liveStream,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveStreams/update
  Future<LiveStream> updateLiveStream({
    String accessToken,
    LiveQuery query,
    LiveStream liveStream,
  });

  ///https://developers.google.com/youtube/v3/live/docs/liveStreams/delete
  Future<LiveStream> deleteLiveStream({
    String accessToken,
    LiveQuery query,
  });


}
