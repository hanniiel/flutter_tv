import 'package:flutter_tv/models/vimeo_video_data.dart';
import 'package:http/http.dart' as http;

class VimeoRepository {
  static const String urlBase = 'https://api.vimeo.com';
  static const String auth = '';

  // {String videoId = '408600892'}
  static Future<VideoData> getVideo(String videoId) async {
    var response = await http.get(Uri.parse("$urlBase/videos/$videoId"),
        headers: {'Authorization': auth});

    if (response.statusCode == 200) {
      return VideoData.fromRawJson(response.body);
    } else {
      print('error');
      throw Exception('Server response wrong');
    }
  }
}
