import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: SingleChildScrollView(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: summaryData.map((data) {
            return Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (data['answeredCorrectly'] as bool)
                          ? Colors.teal.shade300
                          : Colors.deepOrange.shade600,
                    ),
                    padding: EdgeInsets.all(12),
                    child:
                        Text(((data['questionIndex'] as int) + 1).toString()),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data['selectedAnswer'] as String,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 214, 205, 231)),
                        ),
                        Text(
                          data['correctAnswer'] as String,
                          style: TextStyle(color: Colors.teal.shade200),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
