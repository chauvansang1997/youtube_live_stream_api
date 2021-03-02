class Thumbnail {
  Thumbnail.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    width = json["width"];
    height = json["height"];
  }

  String url;
  int width;
  int height;
}
