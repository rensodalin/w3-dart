// import 'quiz.dart';

// class Player {
//   final String name;
//   int score;
//   int points;

//   Player({
//     required this.name,
//     this.score = 0,
//     this.points = 0,
//   });
// }

// class GameController {
//   final Quiz quiz;
//   final Map<String, Player> players = {};

//   GameController({required this.quiz});

//   void addPlayer(String name) {
//     players[name] = Player(name: name);
//   }

//   bool hasPlayer(String name) {
//     return players.containsKey(name);
//   }

//   void submitQuiz(String playerName, List<Answer> answers) {
//     if (!hasPlayer(playerName)) {
//       addPlayer(playerName);
//     }

//     quiz.answers.clear();
//     quiz.answers.addAll(answers);
//     players[playerName]!.score = quiz.getScoreInPercentage();
//     players[playerName]!.points = quiz.getScoreInPoints();
//   }

//   List<MapEntry<String, Player>> getPlayerScores() {
//     return players.entries.toList();
//   }
// }
import 'quiz.dart';

class Player {
  final String name;
  int score;
  int points;

  Player({
    required this.name,
    this.score = 0,
    this.points = 0,
  });
}

class GameController {
  final Quiz quiz;
  final Map<String, Player> players = {};

  GameController({required this.quiz});

  void addPlayer(String name) {
    players[name] = Player(name: name);
  }

  bool hasPlayer(String name) => players.containsKey(name);

  void submitQuiz(String playerName, List<Answer> answers) {
    if (!hasPlayer(playerName)) addPlayer(playerName);

    quiz.answers = answers;
    players[playerName]!.score = quiz.getScoreInPercentage();
    players[playerName]!.points = quiz.getScoreInPoints();
  }

  List<MapEntry<String, Player>> getPlayerScores() => players.entries.toList();
}
