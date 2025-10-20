
// import 'package:my_first_project/domain/quiz.dart';
// import 'package:test/test.dart';

// void main() {
//   late Question q1;
//   late Question q2;
//   late Quiz quiz;

//   setUp(() {
//     q1 = Question(title: "4-2", choices: ["1", "2", "3"], goodChoice: "2");
//     q2 = Question(title: "4+2", choices: ["1", "2", "3"], goodChoice: "6");
//     quiz = Quiz(questions: [q1, q2]);
//   });

//   test("test 1 - all correct", () {
//     quiz.addAnswer(Answer(question: q1, answerChoice: "2"));
//     quiz.addAnswer(Answer(question: q2, answerChoice: "6"));
//     expect(quiz.getScoreInPercentage(), equals(100));
//     expect(quiz.getScoreInPoints(), equals(2));
//     expect(quiz.getTotalPoints(), equals(2));
//   });

//   test("test 2 - all wrong", () {
//     quiz.addAnswer(Answer(question: q1, answerChoice: "7"));
//     quiz.addAnswer(Answer(question: q2, answerChoice: "9"));
//     expect(quiz.getScoreInPercentage(), equals(0));
//     expect(quiz.getScoreInPoints(), equals(0));
//     expect(quiz.getTotalPoints(), equals(2));
//   });

//   test("test 3 - custom points", () {
//     // Q1: 10 points, Q2: 50 points
//     Question cq1 =
//         Question(title: "Q1", choices: ["A", "B"], goodChoice: "A", points: 50);
//     Question cq2 =
//         Question(title: "Q2", choices: ["X", "Y"], goodChoice: "Y", points: 50);
//     Quiz cquiz = Quiz(questions: [cq1, cq2]);

//     // All correct
//     cquiz.addAnswer(Answer(question: cq1, answerChoice: "A"));
//     cquiz.addAnswer(Answer(question: cq2, answerChoice: "Y"));
//     expect(cquiz.getTotalPoints(), equals(60));
//     expect(cquiz.getScoreInPoints(), equals(60));
//     expect(cquiz.getScoreInPercentage(), equals(100));

//     // One correct, one wrong
//     Quiz cquiz2 = Quiz(questions: [cq1, cq2]);
//     cquiz2.addAnswer(Answer(question: cq1, answerChoice: "A")); // correct (10)
//     cquiz2.addAnswer(Answer(question: cq2, answerChoice: "X")); // wrong (0)
//     expect(cquiz2.getTotalPoints(), equals(60));
//     expect(cquiz2.getScoreInPoints(), equals(10));
//     expect(cquiz2.getScoreInPercentage(), equals(16)); // 10/60 = 16%

//     // All wrong
//     Quiz cquiz3 = Quiz(questions: [cq1, cq2]);
//     cquiz3.addAnswer(Answer(question: cq1, answerChoice: "B")); // wrong
//     cquiz3.addAnswer(Answer(question: cq2, answerChoice: "X")); // wrong
//     expect(cquiz3.getTotalPoints(), equals(60));
//     expect(cquiz3.getScoreInPoints(), equals(0));
//     expect(cquiz3.getScoreInPercentage(), equals(0));
//   });
// }
// import 'package:my_first_project/domain/quiz.dart';
// import 'package:test/test.dart';

// void main() {
//   late Question q1;
//   late Question q2;
//   late Quiz quiz;

//   setUp(() {
//     q1 = Question(title: "4-2", choices: ["1", "2", "3"], goodChoice: "2");
//     q2 = Question(title: "4+2", choices: ["1", "2", "3", "6"], goodChoice: "6");
//     quiz = Quiz(questions: [q1, q2]);
//   });

//   test("test 1 - all correct", () {
//     quiz.addAnswer(Answer(question: q1, answerChoice: "2"));
//     quiz.addAnswer(Answer(question: q2, answerChoice: "6"));
//     expect(quiz.getScoreInPercentage(), equals(100));
//     expect(quiz.getScoreInPoints(), equals(2));
//     expect(quiz.getTotalPoints(), equals(2));
//   });

//   test("test 2 - all wrong", () {
//     quiz.addAnswer(Answer(question: q1, answerChoice: "7"));
//     quiz.addAnswer(Answer(question: q2, answerChoice: "9"));
//     expect(quiz.getScoreInPercentage(), equals(0));
//     expect(quiz.getScoreInPoints(), equals(0));
//     expect(quiz.getTotalPoints(), equals(2));
//   });

//   test("test 3 - custom points", () {
//     // Both questions worth 50 points
//     Question cq1 =
//         Question(title: "Q1", choices: ["A", "B"], goodChoice: "A", points: 50);
//     Question cq2 =
//         Question(title: "Q2", choices: ["X", "Y"], goodChoice: "Y", points: 50);
//     Quiz cquiz = Quiz(questions: [cq1, cq2]);

//     // All correct
//     cquiz.addAnswer(Answer(question: cq1, answerChoice: "A"));
//     cquiz.addAnswer(Answer(question: cq2, answerChoice: "Y"));
//     expect(cquiz.getTotalPoints(), equals(100));
//     expect(cquiz.getScoreInPoints(), equals(100));
//     expect(cquiz.getScoreInPercentage(), equals(100));

//     // One correct, one wrong
//     Quiz cquiz2 = Quiz(questions: [cq1, cq2]);
//     cquiz2.addAnswer(Answer(question: cq1, answerChoice: "A")); // correct (50)
//     cquiz2.addAnswer(Answer(question: cq2, answerChoice: "X")); // wrong (0)
//     expect(cquiz2.getTotalPoints(), equals(100));
//     expect(cquiz2.getScoreInPoints(), equals(50));
//     expect(cquiz2.getScoreInPercentage(), equals(50));

//     // All wrong
//     Quiz cquiz3 = Quiz(questions: [cq1, cq2]);
//     cquiz3.addAnswer(Answer(question: cq1, answerChoice: "B")); // wrong
//     cquiz3.addAnswer(Answer(question: cq2, answerChoice: "X")); // wrong
//     expect(cquiz3.getTotalPoints(), equals(100));
//     expect(cquiz3.getScoreInPoints(), equals(0));
//     expect(cquiz3.getScoreInPercentage(), equals(0));
//   });
// }
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
