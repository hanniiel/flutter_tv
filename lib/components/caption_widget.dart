import 'package:flutter/material.dart';
import 'package:flutter_tv/components/progress_player_custom.dart';
import 'package:flutter_tv/constants/constants.dart';

class CaptionProgressWidget extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final String remaining;
  final EdgeInsets alignment;

  CaptionProgressWidget({
    this.title = 'Pulse squat, squat, piso squaat (10 repeticiones)',
    this.progress = 0,
    this.description = '8 reps',
    this.remaining = '00:14',
    this.alignment = const EdgeInsets.only(left: 90, right: 30),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: alignment,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title ($description)',
                  textScaleFactor: 1.2,
                  overflow: TextOverflow.ellipsis,
                  style: kTitleCardStyle.copyWith(fontSize: 15),
                  maxLines: 1,
                ),
                Container(
                  height: 50,
                  child: SliderTheme(
                    //track h vertical
                    //tick mark divisions
                    data: SliderThemeData(
                      trackShape: CustomTrackShape(),
                      trackHeight: 10,
                      inactiveTickMarkColor: Colors.white.withOpacity(0.5),
                      disabledActiveTickMarkColor:
                          Colors.white.withOpacity(0.5),
                      activeTickMarkColor: Colors.white,
                      inactiveTrackColor: Colors.white.withOpacity(0.25),
                      thumbShape: SliderComponentShape.noThumb,
                      activeTrackColor: Color(0xFFD8D8D8),
                    ),
                    child: Slider(
                      onChanged: (value) {},
                      value: progress,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 11),
          Text(
            remaining,
            textScaleFactor: 1.1,
            style: kTutorName.copyWith(
              fontSize: 12,
              color: Colors.white.withOpacity(0.65),
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
