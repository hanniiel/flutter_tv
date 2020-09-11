class Subtitle {
  Duration start;
  Duration end;
  String title;
  String desc;

  Subtitle({this.start, this.end, this.title, this.desc});

  Subtitle.fromMap(Map<String, dynamic> json) {
    start = getTime(json['startAt']);
    end = getTime(json['endAt']);
    title = json['title'];
    desc = json['desc'];
  }

  Duration getTime(String time) {
    var parsedTime = time.split(':');

    return Duration(
        hours: int.parse(parsedTime[0]),
        minutes: int.parse(parsedTime[1]),
        seconds: int.parse(parsedTime[2]),
        microseconds: int.parse(parsedTime[3]));
  }
}
