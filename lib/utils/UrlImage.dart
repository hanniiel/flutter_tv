class UrlImage {
  static const String _base = '';
  static String getUrl(String path) =>
      "$_base${path.replaceAll('/', '%2F')}?alt=media";
}
