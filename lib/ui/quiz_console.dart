

import 'dart:io';
import '../domain/quiz.dart';
import '../domain/game_controller.dart';

class QuizConsole {
  final GameController gameController;

  QuizConsole({required Quiz quiz})
      : gameController = GameController(quiz: quiz);

  void start() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Your name (press Enter to quit): ');
      String? playerName = stdin.readLineSync();

      if (playerName == null || playerName.trim().isEmpty) {
        print('\n--- Quiz Finished ---');
        break;
      }

      List<Answer> answers = [];

      for (var question in gameController.quiz.questions) {
        print('\nQuestion: ${question.title} (${question.points} points)');
        print('Choices: ${question.choices.join(", ")}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          answers.add(Answer(
            questionId: question.id,
            answerChoice: userInput,
          ));
        } else {
          print('No answer entered. Skipping question.');
        }
      }

      gameController.submitQuiz(playerName, answers);
      var currentPlayer = gameController.players[playerName]!;

      print('\n--- Result for $playerName ---');
      print('Score (percentage): ${currentPlayer.score}%');
      print('Score (points): ${currentPlayer.points}');
      print('');

      print('--- Scoreboard ---');
      for (var entry in gameController.getPlayerScores()) {
        print(
            'Player: ${entry.key} | Points: ${entry.value.points} | ${entry.value.score}%');
      }

      print('\n--------------------\n');
    }
  }
}

