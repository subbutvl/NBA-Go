import 'package:flutter/material.dart';
import 'package:nba_go/models/models.dart';
import 'package:nba_go/ui/widgets/players/player_stats/single_stat_widget.dart';

class PlayerStats extends StatelessWidget {
  final PlayerDetail playerDetail;
  final double BORDER_WIDTH = 3.0;

  PlayerStats({@required this.playerDetail}) : assert(playerDetail != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: SingleStatWidget(
                    name: 'PPG', value: playerDetail.currentSeasonStats.ppg),
                flex: 1),
            Expanded(
                child: SingleStatWidget(
                    name: 'APG', value: playerDetail.currentSeasonStats.apg),
                flex: 1),
            Expanded(
                child: SingleStatWidget(
                    name: 'RPG', value: playerDetail.currentSeasonStats.apg),
                flex: 1),
          ],
        ),
        Container(height: BORDER_WIDTH),
        Row(
          children: <Widget>[
            Expanded(
                child: SingleStatWidget(
                    name: 'SPG', value: playerDetail.currentSeasonStats.spg),
                flex: 1),
            Expanded(
                child: SingleStatWidget(
                    name: 'BPG', value: playerDetail.currentSeasonStats.bpg),
                flex: 1),
            Expanded(
                child: SingleStatWidget(
                    name: 'TOPG', value: playerDetail.currentSeasonStats.topg),
                flex: 1),
          ],
        )
      ]),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).backgroundColor,
                  width: BORDER_WIDTH),
              bottom: BorderSide(
                  color: Theme.of(context).backgroundColor,
                  width: BORDER_WIDTH)),
          color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.symmetric(horizontal: 12.5),
    );
  }
}