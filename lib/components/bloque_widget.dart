import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/components/progress_player_custom.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/models/subtitle.dart';
import 'package:flutter_tv/utils/captions_helper.dart';
import 'package:flutter_tv/utils/format_time.dart';
import 'package:platform_svg/platform_svg.dart';

class BloqueWidget extends StatelessWidget {
  final SubtitleInfo header;
  final List<Subtitle> headers;

  BloqueWidget({this.header, this.headers});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            formatDuration(header.remaining),
            style: kTitleCardStyle.copyWith(fontSize: 24),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: CaptionsHelper.headers.map((e) {
                var title = e.title.toLowerCase().contains("intro")
                    ? "intro"
                    : e.title.toLowerCase();
                return Opacity(
                  opacity: e.title == header.subtitle.title ? 1 : 0.3,
                  child: Container(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        PlatformSvg.asset(
                          'assets/icons/bloques/$title.svg',
                          height: 30,
                          alignment: Alignment.center,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 15,
                          child: SliderTheme(
                            //track h vertical
                            //tick mark divisions
                            data: SliderThemeData(
                              trackHeight: 2,
                              trackShape: CustomTrackShape(),
                              inactiveTickMarkColor:
                                  Colors.white.withOpacity(0.5),
                              disabledActiveTickMarkColor:
                                  Colors.white.withOpacity(0.5),
                              activeTickMarkColor: Colors.white,
                              inactiveTrackColor: Colors.white.withOpacity(0.5),
                              thumbShape: SliderComponentShape.noThumb,
                              thumbColor: Colors.white,
                              activeTrackColor: Colors.white,
                            ),
                            child: Slider(
                              onChanged: (value) {},
                              value: e.title == header.subtitle.title
                                  ? header.elapsed.inMicroseconds /
                                      header.total.inMicroseconds
                                  : 0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
