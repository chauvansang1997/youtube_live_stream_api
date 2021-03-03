import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';
import 'package:youtube_live_stream_api_example/bloc/youtube_live_stream_event.dart';
import 'package:youtube_live_stream_api_example/bloc/youtube_live_stream_state.dart';

class YouTubeLiveStreamBloc
    extends Bloc<YoutubeLiveStreamEvent, YoutubeLiveStreamState> {
  YouTubeLiveStreamBloc({YoutubeApi youtubeApi})
      : super(YoutubeLiveStreamLoading()) {
    _youtubeApi = youtubeApi ?? GetIt.I<YoutubeApi>();
  }

  String _accessToken;
  YoutubeApi _youtubeApi;

  @override
  Stream<YoutubeLiveStreamState> mapEventToState(
      YoutubeLiveStreamEvent event) async* {
    if (event is YoutubeLiveStreamLoaded) {
      yield YoutubeLiveStreamBusy();
      try {
        _accessToken = event.accessToken;
        final LiveBroadcastListResponse broadcastListResponse =
            await _youtubeApi.getLiveBroadcastList(
                accessToken: _accessToken,
                query: LiveQuery(
                  maxResults: 10,
                  part: 'id,snippet,contentDetails,status',
                  broadcastStatus: 'upcoming',
                ));

        yield YoutubeLiveStreamLoadSuccess(
            liveBroadcasts: broadcastListResponse.items);
      } catch (e, stack) {
        yield YoutubeLiveStreamLoadFailure(error: e.toString());
      }
    } else if (event is YoutubeLiveStreamInserted) {
      yield YoutubeLiveStreamBusy();
      try {
        DateTime scheduledStartTime = DateTime.now();
        scheduledStartTime = scheduledStartTime.add(const Duration(seconds: 10));
        final LiveBroadcast liveBroadcast = LiveBroadcast(
            kind: 'youtube#liveBroadcast',
            snippet: Snippet(
              title: event.title,
              scheduledStartTime: scheduledStartTime,
            ),
            contentDetails: LiveBroadcastContentDetails(
                monitorStream: MonitorStream(enableMonitorStream: false),
                enableAutoStart: true
            ),
            status: LiveBroadcastStatus(
              privacyStatus: 'public',
              selfDeclaredMadeForKinds: true,
              madeForKinds: false,
            ));

        final LiveBroadcast liveBroadcastCreate = await _youtubeApi.insertLiveBroadcast(
            accessToken: _accessToken,
            liveBroadcast: liveBroadcast,
            query: LiveQuery(part: 'snippet,status,contentDetails'));

        final LiveStream liveStream = LiveStream(
          kind: '"youtube#liveStream',
          cdn: Cdn(frameRate: '30fps', ingestionType: 'rtmp', resolution: '720p'),
          snippet: Snippet(
            title: event.title,
            description: event.description,
          ),
        );

        final LiveStream liveSteamResult = await _youtubeApi.insertLiveStream(
            accessToken: _accessToken, liveStream: liveStream, query: LiveQuery(part: 'snippet,cdn'));

        final LiveBroadcast liveBroadcastResult = await _youtubeApi.bindLiveBroadcast(
            accessToken: _accessToken,
            query: LiveQuery(id: liveBroadcastCreate.id, part: 'id,contentDetails', streamId: liveSteamResult.id));

        final String streamId = liveBroadcastResult.contentDetails.boundStreamId;
        if (streamId != null) {
          final IngestionInfo ingestionInfo = liveSteamResult.cdn.ingestionInfo;

          ///Rtmp url to live stream
          final String rtmpUrl = '${ingestionInfo.ingestionAddress}/${ingestionInfo.streamName}';
        }
        yield YoutubeLiveStreamInsertSuccess();
      } catch (e, stack) {
        yield YoutubeLiveStreamLoadFailure(error: e.toString());
      }
    }else if(event is YoutubeLiveStreamDeleted){

    }
  }
}
