import 'package:http/http.dart';
import 'package:nba_go/repositories/nba_api_client.dart';

class NBALinks {
  
  static Future<NBALinks> nbaLinks = _createNBALinks();
  static const _PLAYER_PROFILE_IMAGE_BASE_URL =
      "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/{{personId}}.png";
  String _todayScoreboard, _gameScoreboard, _teams, _players, _playerProfile, _standingsConference, _gameStats, _date;
  DateTime _currentDate;

  static Future<NBALinks> _createNBALinks() async {
    NBAApiClient nbaApiClient = new NBAApiClient(httpClient: new Client());
    Map<String, dynamic> linksJSON = await nbaApiClient.getNBALinksJSON();
    return NBALinks._private(linksJSON['links']);
  }

  NBALinks._private(Map<String, dynamic> linksJSON) {
    this._todayScoreboard = linksJSON['todayScoreboard'];
    this._gameScoreboard = linksJSON['scoreboard'];
    this._teams = linksJSON['teams'];
    this._players = linksJSON['leagueRosterPlayers'];
    this._playerProfile = linksJSON['playerProfile'];
    this._gameStats = linksJSON['boxscore'];
    this._standingsConference = linksJSON['leagueConfStandings'];
    this._currentDate = DateTime.parse(linksJSON['currentDate']);
    this._date = linksJSON['currentDate'];
  }

  String get todayScoreboard => _todayScoreboard;
  String get teams => _teams;
  String get players => _players;
  String get playerProfile => _playerProfile;
  String get standingsConference => _standingsConference;
  DateTime get currentDate => _currentDate;
  String get date => _date;
  String scoreboard(String gameDate) => _gameScoreboard.replaceAll("{{gameDate}}", gameDate);
  String gameStats(String gameDate, String gameId) {
    String gameStatURL = this._gameStats.replaceAll("{{gameDate}}", gameDate);
    gameStatURL = gameStatURL.replaceAll("{{gameId}}", gameId);
    return gameStatURL;
  }
  static String getPlayerProfilePic(String personId) {
    return _PLAYER_PROFILE_IMAGE_BASE_URL.replaceAll('{{personId}}', personId);
  }
}