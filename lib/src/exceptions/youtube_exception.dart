
import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';



///Exception from youtube
class YoutubeException implements Exception {
  YoutubeErrorList youtubeErrorList;
  String _message;
  String _prefix;

  YoutubeException.fromJson(Map<String, dynamic> jsonMap) {
    youtubeErrorList = jsonMap["error"] != null ? YoutubeErrorList.fromJson(jsonMap["error"]) : null;
    _message = youtubeErrorList != null ? youtubeErrorList.toString() : "YoutubeException";
  }

  @override
  String toString() => '${_prefix ?? ''}$_message';
}
