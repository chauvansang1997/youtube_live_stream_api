import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

abstract class YoutubeLiveStreamState {}

class YoutubeLiveStreamBusy extends YoutubeLiveStreamState {}

class YoutubeLiveStreamLoading extends YoutubeLiveStreamState {}

class YoutubeLiveStreamLoadSuccess extends YoutubeLiveStreamState {

  YoutubeLiveStreamLoadSuccess({this.liveBroadcasts});
  final List<LiveBroadcast> liveBroadcasts;

}

class YoutubeLiveStreamInsertSuccess extends YoutubeLiveStreamState {}

class YoutubeLiveStreamDeleteSuccess extends YoutubeLiveStreamState {}

class YoutubeLiveStreamLoadFailure extends YoutubeLiveStreamState {
  YoutubeLiveStreamLoadFailure({this.error});

  final String error;
}
