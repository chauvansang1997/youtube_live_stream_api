

import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class YoutubeErrorList {
  int code;
  String message;
  List<YoutubeError> youtubeErrors;

  YoutubeErrorList.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    code = json["code"];
    final List<YoutubeError> youtubeErrorList = [];
    if (json["errors"] != null) {
      final errors = json["errors"] as List;
      for (final error in errors) {
        youtubeErrorList.add(new YoutubeError.fromJson(error));
      }
    }
  }

  @override
  String toString() {
    return "YoutubeErrorList error code:$code, message:$message";
  }
}
