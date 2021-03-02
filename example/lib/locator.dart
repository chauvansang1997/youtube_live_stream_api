import 'package:get_it/get_it.dart';
import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton<YoutubeApi>(() => YoutubeApiV3(apiKey: 'YOUR_API_KEY', log: true));
}
