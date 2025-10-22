
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.points = 0,
  }) : id = id ?? uuid.v4();
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice,
  }) : id = id ?? uuid.v4();

  bool isGood(List<Question> questions) {
    final question = questions.firstWhere((q) => q.id == questionId);
    return answerChoice == question.goodChoice;
  }
}

class Quiz {
  final String id;
  List<Question> questions;
  List<Answer> answers = [];

  Quiz({String? id, required this.questions}) : id = id ?? uuid.v4();

  void addAnswer(Answer answer) => answers.add(answer);

  int getTotalPoints() => questions.fold(0, (sum, q) => sum + q.points);

  int getScoreInPoints() {
    int score = 0;
    for (Answer a in answers) {
      if (a.isGood(questions)) {
        final q = questions.firstWhere((q) => q.id == a.questionId);
        score += q.points;
      }
    }
    return score;
  }

  int getScoreInPercentage() {
    int total = getTotalPoints();
    if (total == 0) return 0;
    return ((getScoreInPoints() / total) * 100).toInt();
  }
  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((q) => q.id == id);
    } catch (_) {
      return null;
    }
  }
  Answer? getAnswerById(String id) {
    try {
      return answers.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }
}
