import 'package:flutter_tv/environment.dart';
import 'package:flutter_tv/models/vimeo_video_data.dart';
import 'package:http/http.dart' as http;

class VimeoRepository {
  final String urlBase = 'https://api.vimeo.com/';
  final String auth = Environment.VIMEO_TOKEN;
  final String folder = 'videos/';

  // {String videoId = '408600892'}
  Future<VideoData> getVideo(String videoId) async {
    var response = await http
        .get("$urlBase$folder$videoId", headers: {'Authorization': auth});

    if (response.statusCode == 200) {
      return VideoData.fromRawJson(response.body);
    } else {
      print('error');
      throw Exception('Server response wrong');
    }
  }
}
