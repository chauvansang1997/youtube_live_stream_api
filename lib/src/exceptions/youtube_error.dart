class YoutubeError {
  String message;
  String domain;
  String reason;
  String extendedHelp;

  YoutubeError.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    domain = json["domain"];
    reason = json["reason"];
    extendedHelp = json["extendedHelp"];
  }
}
