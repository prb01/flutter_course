import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.onTap, required this.selectedAnswers});

  final void Function() onTap;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'selectedAnswer': selectedAnswers[i],
        'answeredCorrectly': questions[i].answers[0] == selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data['correctAnswer'] == data['selectedAnswer'])
        .length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$numCorrectAnswers out of $numTotalQuestions\nanswered correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 24,
            ),
            TextButton.icon(
                onPressed: onTap,
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                ),
                label: Text(
                  'Restart quiz!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
