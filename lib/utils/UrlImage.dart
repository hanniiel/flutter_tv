import '../environment.dart';

class UrlImage {
  static const String _base = Environment.URL_IMAGE;
  static String getUrl(String path) =>
      "$_base${path.replaceAll('/', '%2F')}?alt=media";
}
