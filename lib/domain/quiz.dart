// class Question {
//   final String title;
//   final List<String> choices;
//   final String goodChoice;
//   final int points;

//   Question({
//     required this.title,
//     required this.choices,
//     required this.goodChoice,
//     this.points = 0 ,
//   });
// }

// class Answer {
//   final Question question;
//   final String answerChoice;

//   Answer({required this.question, required this.answerChoice});

//   bool isGood() {
//     return this.answerChoice == question.goodChoice;
//   }
// }

// class Quiz {
//   List<Question> questions;
//   List<Answer> answers = [];

//   Quiz({required this.questions});

//   void addAnswer(Answer answer) {
//     this.answers.add(answer);
//   }

//   int getTotalPoints() {
//     return questions.fold(0, (sum, q) => sum + q.points);
//   }

//   int getScoreInPoints() {
//     int score = 0;
//     for (Answer answer in answers) {
//       if (answer.isGood()) {
//         score += answer.question.points;
//       }
//     }
//     return score;
//   }

//   int getScoreInPercentage() {
//     int totalPoints = getTotalPoints();
//     if (totalPoints == 0) return 0;
//     int scoredPoints = getScoreInPoints();
//     return ((scoredPoints / totalPoints) * 100).toInt();
//   }
// }

// import 'package:uuid/uuid.dart';

// final uuid = Uuid();

// class Question {
//   final String id;
//   final String title;
//   final List<String> choices;
//   final String goodChoice;
//   final int points;

//   Question({
//     String? id,
//     required this.title,
//     required this.choices,
//     required this.goodChoice,
//     this.points = 0,
//   }) : id = id ?? uuid.v4();
// }

// class Answer {
//   final String id;
//   final String questionId;
//   final String answerChoice;

//   Answer({
//     String? id,
//     required this.questionId,
//     required this.answerChoice,
//   }) : id = id ?? uuid.v4();

//   bool isGood(List<Question> questions) {
//     final question = questions.firstWhere((q) => q.id == questionId);
//     return answerChoice == question.goodChoice;
//   }
// }

// class Quiz {
//   final String id;
//   List<Question> questions;
//   List<Answer> answers = [];

//   Quiz({String? id, required this.questions}) : id = id ?? uuid.v4();

//   void addAnswer(Answer answer) => answers.add(answer);

//   Question? getQuestionById(String id) =>
//       questions.firstWhere((q) => q.id == id);

//   Answer? getAnswerById(String id) => answers.firstWhere((a) => a.id == id);

//   int getTotalPoints() => questions.fold(0, (sum, q) => sum + q.points);

//   int getScoreInPoints() {
//     int score = 0;
//     for (Answer a in answers) {
//       if (a.isGood(questions)) {
//         final q = questions.firstWhere((q) => q.id == a.questionId);
//         score += q.points;
//       }
//     }
//     return score;
//   }

//   int getScoreInPercentage() {
//     int total = getTotalPoints();
//     if (total == 0) return 0;
//     return ((getScoreInPoints() / total) * 100).toInt();
//   }
// }
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

  /// 🔍 Get question by ID safely
  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((q) => q.id == id);
    } catch (_) {
      return null;
    }
  }

  /// 🔍 Get answer by ID safely
  Answer? getAnswerById(String id) {
    try {
      return answers.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }
}
