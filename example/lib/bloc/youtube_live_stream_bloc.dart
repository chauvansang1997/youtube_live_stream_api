import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';
import 'package:youtube_live_stream_api_example/bloc/youtube_live_stream_event.dart';
import 'package:youtube_live_stream_api_example/bloc/youtube_live_stream_state.dart';

class YouTubeLiveStreamBloc extends Bloc<YoutubeLiveStreamEvent, YoutubeLiveStreamState> {
  YouTubeLiveStreamBloc({YoutubeApi youtubeApi}) : super(YoutubeLiveStreamLoading()) {
    _youtubeApi = youtubeApi ?? GetIt.I<YoutubeApi>();
  }

  String _accessToken;
  String _apiKey;
  YoutubeApi _youtubeApi;

  @override
  Stream<YoutubeLiveStreamState> mapEventToState(YoutubeLiveStreamEvent event) async* {
    if (event is YoutubeLiveStreamLoaded) {
      try {
        _accessToken = event.accessToken;
        _youtubeApi.getLiveBroadcastList(accessToken:  _accessToken, query: )
      } catch (e, stack) {

      }
    }
  }
}
