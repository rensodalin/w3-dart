// import 'dart:convert';
// import 'dart:io';
// import '../domain/quiz.dart';
// import '../domain/game_controller.dart';

// class QuizRepository {
//   final String filePath;

//   QuizRepository(this.filePath);

//   Quiz readQuiz() {
//     final file = File(filePath);
//     final content = file.readAsStringSync();
//     final data = jsonDecode(content);

//     var questionsJson = data['questions'] as List;
//     var questions = questionsJson.map((q) {
//       return Question(
//         id: q['id'],
//         title: q['title'],
//         choices: List<String>.from(q['choices']),
//         goodChoice: q['goodChoice'],
//         points: q['points'],
//       );
//     }).toList();

//     var quiz = Quiz(
//       id: data['id'],
//       questions: questions,
//     );

//     return quiz;
//   }

//   // (BONUS) Write quiz to JSON file
//   void writeQuiz(Quiz quiz) {
//     final data = {
//       'id': quiz.id,
//       'questions': quiz.questions
//           .map((q) => {
//                 'id': q.id,
//                 'title': q.title,
//                 'choices': q.choices,
//                 'goodChoice': q.goodChoice,
//                 'points': q.points,
//               })
//           .toList(),
//     };

//     final file = File(filePath);
//     file.writeAsStringSync(jsonEncode(data));
//   }
// }
import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        points: q['points'],
      );
    }).toList();

    var answersJson = data['answers'] as List? ?? [];
    var answers = answersJson.map((a) {
      return Answer(
        id: a['id'],
        questionId: a['questionId'],
        answerChoice: a['answerChoice'],
      );
    }).toList();

    var quiz = Quiz(id: data['id'], questions: questions);
    quiz.answers = answers;

    return quiz;
  }

  void writeQuiz(Quiz quiz) {
    final data = {
      'id': quiz.id,
      'questions': quiz.questions
          .map((q) => {
                'id': q.id,
                'title': q.title,
                'choices': q.choices,
                'goodChoice': q.goodChoice,
                'points': q.points,
              })
          .toList(),
      'answers': quiz.answers
          .map((a) => {
                'id': a.id,
                'questionId': a.questionId,
                'answerChoice': a.answerChoice,
              })
          .toList(),
    };

    final file = File(filePath);
    file.writeAsStringSync(JsonEncoder.withIndent('  ').convert(data));
  }
}
