// import 'dart:math';

// import 'domain/quiz.dart';
// import 'ui/quiz_console.dart';

// void main() {
//   List<Question> questions = [
//     Question(
//         title: "Capital of France?",
//         choices: ["Paris", "London", "Rome"],
//         goodChoice: "Paris",
//         points: 50),
//     Question(
//         title: "2 + 2 = ?",
//         choices: ["2", "4", "5"],
//         goodChoice: "4",
//         points: 50),
//   ];

//   Quiz quiz = Quiz(questions: questions);
//   QuizConsole console = QuizConsole(quiz: quiz);

//   console.start();
// }
// import 'package:my_first_project/ui/quiz_console.dart';
// import 'package:my_first_project/data/quiz_repository.dart';

// void main() {
//   const filePath =
//       'quiz.json'; // Make sure this file exists in the project root

//   final quizRepo = QuizRepository(filePath);
//   final quiz = quizRepo.readQuiz();

//   QuizConsole console = QuizConsole(quiz: quiz);
//   console.start();

//   quizRepo.writeQuiz(quiz); // Save progress after session ends
// }
import 'data/quiz_repository.dart';
import 'ui/quiz_console.dart';

void main() {
  const filePath = 'data/quiz_data.json'; // Correct path and filename

  final repo = QuizRepository(filePath);
  final quiz = repo.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);
  console.start();

  repo.writeQuiz(quiz);
}
