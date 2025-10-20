

import 'package:test/test.dart';
import 'package:my_first_project/domain/quiz.dart';

void main() {
  late Question q1;
  late Question q2;
  late Quiz quiz;

  setUp(() {
    q1 = Question(
        title: "4 - 2", choices: ["1", "2", "3"], goodChoice: "2", points: 1);
    q2 = Question(
        title: "4 + 2",
        choices: ["1", "2", "3", "6"],
        goodChoice: "6",
        points: 1);
    quiz = Quiz(questions: [q1, q2]);
  });

  test("All correct", () {
    quiz.addAnswer(Answer(questionId: q1.id, answerChoice: "2"));
    quiz.addAnswer(Answer(questionId: q2.id, answerChoice: "6"));
    expect(quiz.getScoreInPercentage(), equals(100));
  });

  test("All wrong", () {
    quiz.addAnswer(Answer(questionId: q1.id, answerChoice: "1"));
    quiz.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test("Half correct", () {
    quiz.addAnswer(Answer(questionId: q1.id, answerChoice: "2"));
    quiz.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test("Get question by ID", () {
    var found = quiz.getQuestionById(q1.id);
    expect(found, isNotNull);
    expect(found!.title, equals("4 - 2"));
  });
}
