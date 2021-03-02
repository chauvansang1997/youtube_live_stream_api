import 'package:youtube_live_stream_api/src/models/thumbnail.dart';

class Thumbnails {
  Thumbnails.fromJson(Map<String, dynamic> json) {
    data = <String, Thumbnail>{};
    json.keys.forEach((key) => data[key] = Thumbnail.fromJson(json[key]));
  }

  Map<String, Thumbnail> data;

  Map<String, dynamic> toJson([bool removeIfNull = false]) {
    final Map<String, dynamic> json = <String, dynamic>{};
    data.keys.forEach((key) => json[key] = {
          'url': data[key].url,
          'width': data[key].width,
          'height': data[key].height,
        });

    if(removeIfNull){
      json.removeWhere((key, value) => value == null);
    }

    return data;
  }
}
