import 'package:flutter/material.dart';
import 'package:github_browser/features/question_list/domain/entity/question_answer_entity.dart';

class QuestionListItem extends StatelessWidget {
  final QuestionAnswerEntity entity;
  final VoidCallback answerQuestion;

  const QuestionListItem({
    Key? key,
    required this.answerQuestion,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerQuestion,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(entity.question),
            Text(entity.answer ?? "-Yet to answer-")
          ],
        ),
      ),
    );
  }
}
