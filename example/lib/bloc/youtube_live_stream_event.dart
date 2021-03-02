import 'package:flutter/cupertino.dart';

abstract class YoutubeLiveStreamEvent {}

class YoutubeLiveStreamLoaded extends YoutubeLiveStreamEvent {
  YoutubeLiveStreamLoaded({@required this.accessToken, @required this.apiKey});

  final String accessToken;
  final String apiKey;
}

class YoutubeLiveStreamRefreshed extends YoutubeLiveStreamEvent {}

class YoutubeLiveStreamInserted extends YoutubeLiveStreamEvent {}

class YoutubeLiveStreamDeleted extends YoutubeLiveStreamEvent {}
