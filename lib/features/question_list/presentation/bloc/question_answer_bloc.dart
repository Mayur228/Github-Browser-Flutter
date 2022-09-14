import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/question_list/presentation/bloc/question_answer_event.dart';
import 'package:github_browser/features/question_list/presentation/bloc/question_answer_state.dart';

class QuestionAnswerBloc extends Bloc<QuestionAnswerEvent,QuestionAnswerState> {
  QuestionAnswerBloc(super.initialState);

}