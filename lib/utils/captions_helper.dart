import 'package:flutter_tv/models/subtitle.dart';
import 'package:flutter_tv/models/training_entity.dart';

class CaptionsHelper {
  static List<Subtitle> _captions = [];
  static List<Subtitle> headers = [];

  static void setCaptions(TrainingEntity training) {
    _captions.clear();
    headers.clear();
    for (var series in training.series) {
      for (var serie in series['serie']) {
        _captions.add(Subtitle.fromMap(serie));
      }
    }
    for (var header in training.bloques) {
      headers.add(Subtitle.fromMap(header));
    }
  }

  static SubtitleInfo getHeader(Duration position) {
    var header = headers.singleWhere(
        (element) => position >= element.start && position <= element.end,
        orElse: () => null);
    if (header == null) return null;

    var from = header.start;
    var to = header.end;

    return SubtitleInfo(
      subtitle: header,
      remaining: (to - position),
      elapsed: (position - from),
      total: (to - from),
    );
  }

  static SubtitleInfo getCaption(Duration position) {
    Subtitle caption = _captions.singleWhere(
        (element) => position >= element.start && position <= element.end,
        orElse: () => null);

    if (caption == null) return null;

    var from = caption.start;
    var to = caption.end;

    return SubtitleInfo(
      subtitle: caption,
      remaining: (to - position),
      elapsed: (position - from),
      total: (to - from),
    );
  }
}

class SubtitleInfo {
  final Subtitle subtitle;
  final Duration remaining;
  final Duration elapsed;
  final Duration total;

  SubtitleInfo({
    this.subtitle,
    this.elapsed,
    this.remaining,
    this.total,
  });
}
